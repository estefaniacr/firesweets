import 'package:fire_sweet_app/Food/ui/screens/new_comment.dart';
import 'package:fire_sweet_app/Food/ui/screens/settings_form.dart';
import 'package:fire_sweet_app/User/model/users.dart';
import 'package:flutter/material.dart';
import 'package:fire_sweet_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:fire_sweet_app/Food/ui/screens/user_list.dart';

class CoffeePreferences extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });

    }

    return StreamProvider<List<Users>?>.value(
      initialData: null,
      value: DatabaseService(uid: '').users,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(title: Text("Coffee preferences"), backgroundColor: Colors.purple, elevation: 0.0, actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => _showSettingsPanel()
              )
          ]),
          body: UserList(),),
    );
  }
}
