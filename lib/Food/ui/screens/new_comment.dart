

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_sweet_app/Food/ui/screens/comments.dart';
import 'package:fire_sweet_app/Food/ui/screens/widgets.dart';
import 'package:fire_sweet_app/User/model/user.dart';
import 'package:fire_sweet_app/widgets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication.dart';


class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

    final FirebaseAuth _auth = FirebaseAuth.instance;

  // create MyUser obj based on User
    MyUser? _userFromFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  Future<void> init() async {
    await Firebase.initializeApp();

    // Add from here
    FirebaseFirestore.instance
        .collection('likes')
        .where('like', isEqualTo: true)
        .snapshots()
        .listen((snapshot) {
      _likes = snapshot.docs.length;
      notifyListeners();
    });

    // To here

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
        _commentsSubscription = FirebaseFirestore.instance
            .collection('comments')
            .orderBy('timestamp', descending: true)
            .snapshots()
            .listen((snapshot) {
          _commentsMessages = [];
          for (final document in snapshot.docs) {
            _commentsMessages.add(
              CommentsMessage(
                name: document.data()['name'] as String,
                message: document.data()['text'] as String,
              ),
            );
          }
          notifyListeners();
        });
        // Add from here
        _likeSubscription = FirebaseFirestore.instance
            .collection('likes')
            .doc(user.uid)
            .snapshots()
            .listen((snapshot) {
          if (snapshot.data() != null) {
            if (snapshot.data()!['like'] as bool) {
              _like = Like.yes;
            } else {
              _like = Like.no;
            }
          } else {
            _like = Like.unknown;
          }
          notifyListeners();
        });
        // to here
      } else {
        _loginState = ApplicationLoginState.loggedOut;
        _commentsMessages = [];
        _commentsSubscription?.cancel();
        _likeSubscription?.cancel(); // new
      }
      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  String? _email;
  String? get email => _email;

  StreamSubscription<QuerySnapshot>? _commentsSubscription;
  List<CommentsMessage> _commentsMessages = [];
  List<CommentsMessage> get commentsMessages => _commentsMessages;

  int _likes = 0;
  int get likes => _likes;

  Like _like = Like.unknown;
  StreamSubscription<DocumentSnapshot>? _likeSubscription;
  Like get like => _like;
  set like(Like like) {
    final userDoc = FirebaseFirestore.instance
        .collection('likes')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    if (like == Like.yes) {
      userDoc.set(<String, dynamic>{'like': true});
    } else {
      userDoc.set(<String, dynamic>{'like': false});
    }
  }

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<void> verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<void> registerAccount(
      String email,
      String displayName,
      String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  Future<DocumentReference> addMessageToComments(String message) {
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception('Must be logged in');
    }

    return FirebaseFirestore.instance
        .collection('comments')
        .add(<String, dynamic>{
      'text': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'name': FirebaseAuth.instance.currentUser!.displayName,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    });
  }
}
