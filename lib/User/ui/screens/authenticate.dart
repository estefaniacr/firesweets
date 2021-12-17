import 'package:fire_sweet_app/User/ui/screens/register.dart';
import 'package:fire_sweet_app/User/ui/screens/signin_email_password.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({ Key? key }) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInEmailPassword(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}