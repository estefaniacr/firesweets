import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_file/src/types/interface.dart';
import 'package:fire_sweet_app/User/model/user_model.dart';
import 'package:fire_sweet_app/services/base_database_repository.dart';
import 'package:fire_sweet_app/services/storage_repository.dart';

class DataBaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser() {
    return _firebaseFirestore.collection('users')
    .doc('JcWhD35Ny7g4KQicZV5YsHraH4H2')
    .snapshots()
    .map((snap) => User.fromSnapshot(snap));

  }

  @override
  Future<void> updateUserPictures(String imageName) async {
    String downloadUrl = await StorageRepository().getDownloadUrl(imageName);

    return _firebaseFirestore
    .collection('users')
    .doc('JcWhD35Ny7g4KQicZV5YsHraH4H2')
    .update({
      'imageUrls': FieldValue.arrayUnion([downloadUrl]),
      });
  }
}