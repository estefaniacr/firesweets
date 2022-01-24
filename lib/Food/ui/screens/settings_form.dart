import 'package:fire_sweet_app/User/model/user.dart';
import 'package:fire_sweet_app/services/database.dart';
import 'package:fire_sweet_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:fire_sweet_app/widgets/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}


class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // form values
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;
  bool strFlag = true;

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<MyUser?>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: 'JcWhD35Ny7g4KQicZV5YsHraH4H2').userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            UserData? userData = snapshot.data;

            return Form(
                key: _formKey,
                child: Column(children: [
                  Text('Update your preferences',
                      style: TextStyle(fontSize: 18.0)),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData!.name,
                    decoration: textInputDecoration.copyWith(hintText: 'Name'),
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 20.0),
                  // dropdow
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: _currentSugars ?? userData.sugars,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar sugars'),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() => _currentSugars = val.toString());
                    },
                  ),
                  // Slider
                  Slider(
                    value: (_currentStrength ?? userData.strength).toDouble(),
                    activeColor: Colors.purple[_currentStrength ?? 100],
                    inactiveColor: Colors.purple[_currentStrength ?? 100],
                    min: 100,
                    max: 900,
                    divisions: 8,
                    onChanged: (val) =>
                        setState(() => _currentStrength = val.round()),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                            onPrimary: Colors.white,
                            minimumSize: Size(300, 50)),
                        onPressed: () async {
                          if(_formKey.currentState!.validate()) {
                            await DatabaseService(uid: 'JcWhD35Ny7g4KQicZV5YsHraH4H2').updateUserData(
                              _currentSugars ?? userData.sugars,
                              _currentName ?? userData.name,
                              _currentStrength ?? userData.strength
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ]));
          } else {
            return Loading();
          }
        });
  }
}
