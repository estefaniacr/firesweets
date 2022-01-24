import 'package:fire_sweet_app/Food/ui/screens/comments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication.dart';
import 'new_comment.dart';

class HomeFood extends StatelessWidget {
  const HomeFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 8),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Add from here

                if (appState.loginState == ApplicationLoginState.loggedIn) ...[
                  // Add from here
                  Comments(
                    addMessage: (message) =>
                        appState.addMessageToComments(message),
                    messages: appState.commentsMessages,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
