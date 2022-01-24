import 'package:fire_sweet_app/Food/ui/screens/pictures_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_sweet_app/Food/ui/screens/dashboard_screen.dart';

class AddImagesScreen extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('posts');

  @override
  Widget build(BuildContext context) {
   const List<Tab> tabs = <Tab>[
    Tab(text: 'Pictures'),
  ];
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {}
        });
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Add dessert'),
          actions: [
            MaterialButton(
              onPressed: () {
                ref.add({
                  'title': title.text,
                  'content': content.text,
                }).whenComplete(() {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => DashboardScreen()));
                });
              },
              child: Text("Save", style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => DashboardScreen()));
              },
              child: Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        body: Container(
            child: Column(children: [
                  Pictures(tabController: tabController),
          Container(
            margin: EdgeInsets.only(
                top: 50.0, left: 20.0, right: 20.0, bottom: 30.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: 'Dessert name',
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: content,
                maxLines: 20,
                decoration: InputDecoration(
                    hintText: 'Write a description',
                    contentPadding: EdgeInsets.only(left: 10.0)),
              ),
            ),
          ),
        ])));
  }
      ));}
}
