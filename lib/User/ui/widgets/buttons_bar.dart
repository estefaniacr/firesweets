import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ButtonsBar extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              mini: true,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
              child: Icon(Icons.add, color: Colors.indigo, size: 25.0,),
              onPressed: () => {} ,
            ),
            FloatingActionButton(
              mini: true,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
              child: Icon(Icons.mail_outline, color: Colors.indigo, size: 25.0,),
              onPressed: () => {}
            ),
            FloatingActionButton(
              mini: true,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
              child: Icon(Icons.person, color: Colors.indigo, size: 25.0,),
              onPressed: () => {}
            ),
            FloatingActionButton(
              mini: true,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
              child: Icon(Icons.logout, color: Colors.indigo, size: 25.0,),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ));
  }
}
