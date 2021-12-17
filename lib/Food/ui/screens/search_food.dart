import 'package:fire_sweet_app/Food/ui/screens/settings_form.dart';
import 'package:fire_sweet_app/User/model/users.dart';
import 'package:fire_sweet_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_sweet_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:fire_sweet_app/Food/ui/screens/user_list.dart';

class SearchFood extends StatelessWidget {
  final AuthService _auth = AuthService();

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
          backgroundColor: Colors.deepPurpleAccent,
          appBar: AppBar(title: Text("Logged in"), elevation: 0.0, actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            IconButton(
              icon: Icon(Icons.settings), 
              onPressed: () => _showSettingsPanel()
              )
          ]),
          body: UserList(),),
    );
  }
}
