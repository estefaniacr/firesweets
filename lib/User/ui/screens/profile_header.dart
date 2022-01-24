import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/user_info.dart';

class ProfileHeader extends StatelessWidget {
final FirebaseAuth auth = FirebaseAuth.instance;

void inputData() {
  final User? user = auth.currentUser;
  final uid = user?.uid;
  // here you write the codes to input the data into firestore
}
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Column(
        children: [
          UserInformation(
              "assets/img/hola-peter.png", "Stef", "michis@example.com"),
        ],
      ),
    );
  }
}
