import 'package:fire_sweet_app/services/auth.dart';
import 'package:fire_sweet_app/widgets/constants.dart';
import 'package:fire_sweet_app/widgets/loading.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/identity_providers_buttons.dart';

class SignInEmailPassword extends StatefulWidget {
  final Function toggleView;
  SignInEmailPassword({required this.toggleView});

  @override
  _SignInEmailPasswordState createState() => _SignInEmailPasswordState();
}

class _SignInEmailPasswordState extends State<SignInEmailPassword> {
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
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("FireSweets",
                  style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: "Sofia",
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Container(
                child: Column(children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Email'),
                            validator: (val) =>
                                val!.isEmpty ? 'Enter an email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Password'),
                            validator: (val) => val!.length < 6
                                ? 'Enter a password of at least 6 characters'
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            child: Text("Sign In"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.purple,
                                onPrimary: Colors.white,
                                minimumSize: Size(300, 50)),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => loading = true);
                                dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                if(result == null) {
                                  setState(() {
                                    error = "Could not SignIn with those credentials";
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
                      padding: EdgeInsets.only(top: 15.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 14.0)),
                          TextSpan(
                              text: "Sign up",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 14.0),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  widget.toggleView();
                                })
                        ]),
                      )),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey, height: 100),
                      ),
                      Text("OR", style: TextStyle(color: Colors.grey)),
                      Expanded(
                        child: Divider(color: Colors.grey, height: 100),
                      )
                    ],
                  ),
                  IdentityProvidersButtons(),
                ]),
              )
            ])));
  }
}




class PasswordForm extends StatefulWidget {

  final void Function(String email) callback;

  const PasswordForm({
    required this.login,
    required this.email,
    required this.callback
  });
  final String email;
  final void Function(String email, String password) login;
  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {

  final _formKey = GlobalKey<FormState>(debugLabel: '_PasswordFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }


  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 300.0, horizontal: 50.0),
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("FireSweets",
              style: TextStyle(
                  fontSize: 50.0,
                  fontFamily: "Sofia",
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextFormField(
                        controller: _emailController,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val) => val!.length < 6
                            ? 'Enter a password of at least 6 characters'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            child: Text("Sign In"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.purple,
                                onPrimary: Colors.white,
                                minimumSize: Size(300, 50)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                widget.login(
                                  _emailController.text,
                                  _passwordController.text,
                                );
                              }
                            },
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 15.0),
                  child: RichText(
                    text: TextSpan(children: [

                      TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),


                    ],
                    ),

                  )),
                  SizedBox(height: 12.0),
                  ElevatedButton(
                            child: Text("Sign up"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.black,
                                minimumSize: Size(300, 50)),
                            onPressed: () => {
                              if (_formKey.currentState!.validate()) {
                            widget.callback(_controller.text)
          },

              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey, height: 100),
                  ),
                  Text("OR", style: TextStyle(color: Colors.grey)),
                  Expanded(
                    child: Divider(color: Colors.grey, height: 100),
                  )
                ],
              ),
              IdentityProvidersButtons(),
                            }),
            ])
    )]));
  }

}
