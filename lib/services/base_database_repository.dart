import 'package:fire_sweet_app/User/model/user_model.dart';

abstract class BaseDatabaseRepository {
  Stream<User> getUser();
  Future<void> updateUserPictures(String imageName);
}