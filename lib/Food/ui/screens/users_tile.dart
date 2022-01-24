import 'package:flutter/material.dart';
import 'package:fire_sweet_app/User/model/users.dart';

class UsersTile extends StatelessWidget {
  final Users user;

  UsersTile({ required this.user });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.purple[user.strength],
          ),
          title: Text(user.name),
          subtitle: Text('Takes ${user.sugars} sugar(s)'),
        )),

    );
  }
}