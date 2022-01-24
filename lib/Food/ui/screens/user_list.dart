import 'package:fire_sweet_app/Food/ui/screens/users_tile.dart';
import 'package:fire_sweet_app/User/model/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  const UserList({ Key? key }) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<Users>?>(context) ?? [];

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UsersTile(user: users[index]);

      }
    );
  }
}
