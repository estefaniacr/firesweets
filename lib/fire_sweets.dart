import 'package:fire_sweet_app/Food/ui/widgets/select_file.dart';
import 'package:flutter/material.dart';
import 'Food/ui/screens/home_food.dart';
import 'Food/ui/screens/search_food.dart';
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
    HomeFood(),
    Images(),
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
              icon: Icon(Icons.photo),
              label: "Pictures"
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
