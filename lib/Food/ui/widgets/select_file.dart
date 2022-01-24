import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class Images extends StatefulWidget {


  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  FirebaseStorage storage = FirebaseStorage.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;

  // Select and image from the gallery or take a picture with the camera
  // Then upload to Firebase Storage
  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    PickedFile? pickedImage;
    try {
      pickedImage = await picker.getImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      try {
        // Uploading the selected image with some custom meta data
        await storage.ref(fileName).putFile(
            imageFile,
/*             SettableMetadata(customMetadata: {
              'uploaded_by': 'A bad guy',
              'description': 'Some description...'
            }) */);

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        print(error);
      }
    } catch (err) {
      print(err);
    }
  }

  // Retriew the uploaded images
  // This function is called when the app launches for the first time or when an image is uploaded or deleted
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
      });
    });

    return files;
  }

  // Delete the selected image
  // This function is called when a trash icon is pressed
  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 160.0, right: 20.0, bottom: 5.0),
        child: Column(
          children: [
            Padding(
        padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 10.0),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              mini: true,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
              child: Icon(Icons.add, color: Colors.purple, size: 25.0,),
              onPressed: () => _upload('gallery'),
            ),
            FloatingActionButton(
              mini: true,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
              child: Icon(Icons.camera, color: Colors.purple, size: 25.0,),
              onPressed: () => _upload('camera'),
            ),
            FloatingActionButton(
              mini: true,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
              child: Icon(Icons.logout, color: Colors.purple, size: 25.0,),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        )),
            Expanded(
              child: FutureBuilder(
                future: _loadImages(),
                builder: (context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final Map<String, dynamic> image =
                              snapshot.data![index];
                          return Column(

                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.network(image['url'],
                                      fit: BoxFit.fill),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
                                ),

                                Container(
                                  padding: EdgeInsets.only(left: 250.0),
                                  child:IconButton(
                                            onPressed: () =>
                                                _delete(image['path']),
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ))]);

                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
