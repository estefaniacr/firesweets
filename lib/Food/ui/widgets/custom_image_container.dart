import 'package:fire_sweet_app/services/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({ Key? key, imageUrl }) : super(key: key);

  get imageUrl => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0, right: 10.0),
      child: Container(
        height: 150.0,
        width: 100.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),
        border: Border(bottom: BorderSide(
          width: 1.0,
          color: Colors.purple
        ),
        top: BorderSide(
          width: 1.0,
          color: Colors.purple
        ),
        left: BorderSide(
          width: 1.0,
          color: Colors.purple
        ),
        right: BorderSide(
          width: 1.0,
          color: Colors.purple
        ),
        )),
        child:
        (imageUrl == null) ?
        Align(alignment: Alignment.bottomRight,
        child: IconButton(icon: Icon(
          Icons.add_circle,
          color: Colors.purple,
        ),
        onPressed: () async{
          ImagePicker _picker = ImagePicker();
          final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);

          if (_image == null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No image was selected.')));
          }
          if (_image !=null) {
            print('Uploading...');
            StorageRepository().UploadImage(_image);
          }
        },),
        ) : Image.network(imageUrl!, fit: BoxFit.cover,)

        ),

    );
  }
}