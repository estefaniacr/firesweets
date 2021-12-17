import 'package:fire_sweet_app/Food/ui/screens/user_list.dart';
import 'package:fire_sweet_app/User/model/users.dart';
import 'package:fire_sweet_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


      return StreamProvider<List<Users>?>.value(
      initialData: null,
      value: DatabaseService(uid: '').users,
      child: Container(
        padding: EdgeInsets.only(top: 600.0),
        child: UserList()),
    );
  }
}
