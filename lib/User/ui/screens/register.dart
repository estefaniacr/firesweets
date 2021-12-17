import 'package:fire_sweet_app/services/auth.dart';
import 'package:fire_sweet_app/widgets/constants.dart';
import 'package:fire_sweet_app/widgets/loading.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(top: 113.0),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text("FireSweets",
                  style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: "Sofia",
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Form(
                key: _formKey,
                child: Column(
                children: [
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Name'),
                    validator: (val) => val!.isEmpty ? 'Enter your name' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                    obscureText: true,
                    validator: (val) => val!.length < 6 ? 'Enter a password of at least 6 characters' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    child: Text("Register"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        onPrimary: Colors.white,
                        minimumSize: Size(300, 50)),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => loading = true);
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if(result == null) {
                          setState(() {
                            error = "please supply a valid email";
                            loading = false;
                        });
                        }
                      }
                    },
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              )),
              Container(
          padding: EdgeInsets.only(top: 1.0),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.grey, fontSize: 14.0)),
              TextSpan(
                  text: "Log in",
                  style: TextStyle(color: Colors.blue, fontSize: 14.0),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      widget.toggleView();
                    })
            ]),
          )),
            ]
          )
        )
      );
  }
}
