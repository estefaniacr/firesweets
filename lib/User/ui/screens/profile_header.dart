import 'package:flutter/material.dart';
import '../widgets/user_info.dart';
import '../widgets/buttons_bar.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 80.0),
      child: Column(
        children: [
          UserInfo(
              "assets/img/hola-peter.png", "Estefania", "estefania@account.com"),
          ButtonsBar()
        ],
      ),
    );
  }
}
