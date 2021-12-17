/* import 'package:flutter/material.dart';
import 'package:image_picker/';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PhotoUpload extends StatefulWidget {
  const PhotoUpload({ Key? key }) : super(key: key);

  @override
  _PhotoUploadState createState() => _PhotoUploadState();
}

class _PhotoUploadState extends State<PhotoUpload> {
  File sampleImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
        centerTitle: true,
      ),
      body: Center(
        child: sampleImage == null
        ? Text('Select and image')
        : enableUpload,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage = tempImage;
    });

  }

  Widget enableUpload() {}
} */