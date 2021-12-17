import 'package:fire_sweet_app/Food/ui/screens/home_food.dart';
import 'package:fire_sweet_app/fire_sweets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/* class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return SearchFood();
    }
  }
} */

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return FireSweets();
            } else if (snapshot.hasError) {
              return Center(child: Text("Something Went Wrong!"));
            } else {
              return HomeFood();
            }
          },
        ),
      );
}


/*   Widget build(BuildContext context) {
      final user = Provider.of<MyUser?>(context);

      if(user== null) {
        return Authenticate();
      } else {
        return SearchFood();
      }
  }
}  */