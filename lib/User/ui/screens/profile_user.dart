import 'package:fire_sweet_app/Food/ui/widgets/select_file.dart';
import 'package:flutter/material.dart';
import 'profile_header.dart';

class ProfileFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple,),
      body:
    Stack(
      children:[Images(),
      ProfileHeader()
      ],
    ));
  }
}
