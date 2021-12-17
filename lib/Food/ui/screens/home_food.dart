import 'package:fire_sweet_app/Food/ui/screens/comments.dart';
import 'package:fire_sweet_app/Food/ui/widgets/description_food.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication.dart';
import 'header_appbar.dart';
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
                  HeaderAppBar(),
                  DescriptionFood("Cheesecake", "Cheesecake is a sweet dessert consisting of one or more layers. The main, and thickest, layer consists of a mixture of a soft, fresh cheese (typically cottage cheese, cream cheese or ricotta), eggs, and sugar. If there is a bottom layer, it most often consists of a crust or base made from crushed cookies (or digestive biscuits), graham crackers, pastry, or sometimes sponge cake.[1] Cheesecake may be baked or unbaked (and is usually refrigerated). Cheesecake is usually sweetened with sugar and may be flavored in different ways. Vanilla, spices, lemon, chocolate, pumpkin, or other flavors may be added to the main cheese layer. Additional flavors and visual appeal may be added by topping the finished dessert with fruit, whipped cream, nuts, cookies, fruit sauce, chocolate syrup, or other ingredients."),
                  YesNoSelection(
                    state: appState.like,
                    onSelection: (like) => appState.like = like,
                  ),
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

/* class HomeFood extends StatefulWidget {
  @override
  State<HomeFood> createState() => _HomeFoodState();
}

class _HomeFoodState extends State<HomeFood> {
  String descriptionDummy =
      "El origen del cheesecake yace en la antigua Grecia y el Imperio Romano. Se dice que fue 4.000 años antes de la era actual, y era considerada como una fuente de energía insuperable por algo formaba parte de la alimentación de los atletas de los juegos olímpicos en el año 776 a.";

  @override

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[DescriptionFood("Cheescake", 3, descriptionDummy)],

        ),
        HeaderAppBar(),
Comments(addMessage: (message) =>
                        appState.addMessageToComments(message),
                    messages: appState.commentsMessages,
                  ),
      ],
    );
  } */
  /* Widget build(BuildContext context) {
    return
      Stack(
      children: [
        ListView(
        children : [  ReviewList(),
        DescriptionFood("Cheescake", 3, descriptionDummy),
        HeaderAppBar()
      ],
        )
      ]
    );
  } */

