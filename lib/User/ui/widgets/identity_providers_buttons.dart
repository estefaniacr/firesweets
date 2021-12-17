import 'package:fire_sweet_app/User/repository/firebase_auth_google.dart';
import 'package:fire_sweet_app/services/auth.dart';
import 'package:fire_sweet_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class IdentityProvidersButtons extends StatefulWidget {
  const IdentityProvidersButtons({Key? key}) : super(key: key);

  @override
  _IdentityProvidersButtonsState createState() =>
      _IdentityProvidersButtonsState();
}

class _IdentityProvidersButtonsState extends State<IdentityProvidersButtons> {
    final AuthService _auth = AuthService();
    bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Column(children: [
      Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: ElevatedButton.icon(
            label: Text("Sign In with Gmail"),
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                minimumSize: Size(250, 50)),
            icon: FaIcon(
              FontAwesomeIcons.google,
              color: Colors.redAccent,
            ),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
          )),
      Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                minimumSize: Size(250, 50)),
            onPressed: () async {
              setState(() => loading = true);
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                setState(() {
                  loading= false;
                  print("Error signing in");
                });
              } else {
                print("Signed in");
                print(result);
              }
            },
            child: Text("Sign In Anonymously"),
          ))
    ]);
  }
}
