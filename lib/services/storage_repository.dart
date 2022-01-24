import 'dart:io';

import 'package:fire_sweet_app/services/base_storage_repository.dart';
import 'package:fire_sweet_app/services/database_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageRepository extends BaseStorageRepository {
  final firebase_storage.FirebaseStorage storage =
  firebase_storage.FirebaseStorage.instance;

  @override
  Future<void> UploadImage(XFile image) async {
    try{
      await storage.ref('user_1/${image.name}')
      .putFile(File(image.path))
      .then((p0) => DataBaseRepository()
      .updateUserPictures(image.name));
    } catch(_) {}
  }

  @override
  Future<String> getDownloadUrl(String imageName) async {
    String downloadURL = await storage.ref('user_1/${imageName}')
    .getDownloadURL();
    return downloadURL;
  }
}