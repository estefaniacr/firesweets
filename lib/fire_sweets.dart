import 'package:fire_sweet_app/Food/ui/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'Food/ui/screens/coffee_preferences.dart';
import 'User/ui/screens/profile_user.dart';

class FireSweets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FireSweets();
  }
}

class _FireSweets extends State<FireSweets> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    DashboardScreen(),
    CoffeePreferences(),
    ProfileFood()
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.coffee_sharp),
              label: "Preferences"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"
            )
          ],
        ),
      ),
    );
  }
}
