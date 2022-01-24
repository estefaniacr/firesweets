import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_sweet_app/User/model/user.dart';
import 'package:fire_sweet_app/User/model/users.dart';

class DatabaseService {
  final String  uid;
  DatabaseService({ required this.uid });

  // collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String sugars, String name, int strength) async {
    return await userCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength
    });
  }

  // users list from snapshot
  List<Users> _usersListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Users(
        name: doc.get('name') ?? '',
        sugars: doc.get('sugars')?? '0',
        strength: doc.get('strength') ?? 0
         );
      }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot['name'],
      sugars: snapshot['sugars'],
      strength: snapshot['strength'],
    );
  }

  // get users stream
  Stream<List<Users>> get users {
    return userCollection.snapshots().map(_usersListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots()
      .map(_userDataFromSnapshot);
  }
}