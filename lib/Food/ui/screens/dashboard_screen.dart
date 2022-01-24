import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_sweet_app/Food/ui/screens/authentication.dart';
import 'package:fire_sweet_app/Food/ui/screens/comments.dart';
import 'package:fire_sweet_app/Food/ui/screens/home_food.dart';
import 'package:fire_sweet_app/Food/ui/screens/new_comment.dart';
import 'package:fire_sweet_app/Food/ui/widgets/edit_scree.dart';
import 'package:flutter/material.dart';
import 'package:fire_sweet_app/Food/ui/screens/add_screen.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('posts').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => AddImagesScreen()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.purple,
      ),
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              EditImagesScreen(docid: snapshot.data!.docs[index]),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Text(
                              snapshot.data!.docChanges[index].doc['title'],
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            subtitle: Text(
                              snapshot.data!.docChanges[index].doc['content'],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                          ),
                        ),
                        Consumer<ApplicationState>(
                            builder: (context, appState, _) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Add from here

                                      if (appState.loginState ==
                                          ApplicationLoginState.loggedIn) ...[
                                        Row(
                                          children: [
                                            YesNoSelection(
                                              state: appState.like,
                                              onSelection: (like) =>
                                                  appState.like = like,
                                            ),
                                            IconButton(
                                                onPressed: () => {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                HomeFood()),
                                                      )
                                                    },
                                                icon: Icon(
                                                    Icons.comment_outlined))
                                          ],
                                        )
                                      ],
                                    ]))
                      ],
                    ));
              },
            ),
          );
        },
      ),
    );
  }
}
