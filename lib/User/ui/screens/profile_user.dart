import 'package:fire_sweet_app/Food/ui/widgets/select_file.dart';
import 'package:flutter/material.dart';
import 'profile_header.dart';
import '../widgets/profile_food_list.dart';
import '../widgets/profile_background.dart';

class ProfileFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[ProfileHeader()],
        ),
      ],
    );
  }
}
