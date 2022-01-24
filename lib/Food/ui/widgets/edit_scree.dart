

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_sweet_app/Food/ui/screens/authentication.dart';
import 'package:fire_sweet_app/Food/ui/screens/comments.dart';
import 'package:fire_sweet_app/Food/ui/screens/dashboard_screen.dart';
import 'package:fire_sweet_app/Food/ui/screens/header_appbar.dart';
import 'package:fire_sweet_app/Food/ui/screens/home_food.dart';
import 'package:fire_sweet_app/Food/ui/screens/new_comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditImagesScreen extends StatefulWidget {
  DocumentSnapshot docid;
  EditImagesScreen({required this.docid});

  @override
  _EditImagesScreenState createState() => _EditImagesScreenState();
}

class _EditImagesScreenState extends State<EditImagesScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState() {
    title = TextEditingController(text: widget.docid.get('title'));
    content = TextEditingController(text: widget.docid.get('content'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Edit dessert'),
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'title': title.text,
                'content': content.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => DashboardScreen()));
              });
            },
            child: Text("Save", style: TextStyle(
              color: Colors.white
            )),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => DashboardScreen()));
              });
            },
            child: Text("Delete", style: TextStyle(
              color: Colors.white
            )),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
                      Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Add from here

                if (appState.loginState == ApplicationLoginState.loggedIn) ...[
                  // Add from here
                  HeaderAppBar(),
                  Row(
                    children: [
                      YesNoSelection(
                    state: appState.like,
                    onSelection: (like) => appState.like = like,
                  ),
                  IconButton(onPressed: () => { Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            HomeFood()
                      ),
                    )}, icon: Icon(Icons.comment_outlined))
                    ],
                  )
                ],
              ],
            ),
          ),
            Container(
       margin: EdgeInsets.only(top: 20.0,left: 20.0, right: 20.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: 'title',
                ),
              ),
            ),

            Expanded(
              child: Container(
                 margin: EdgeInsets.only(top: 20.0,left: 20.0, right: 20.0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: content,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'content',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}