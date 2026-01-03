import 'package:hive/hive.dart';
import '../../data/models/user_model.dart';

class AuthLocalDatasource {
  static const String _userBox = 'users';

  Future<void> saveUser(UserModel user) async {
    final box = await Hive.openBox<UserModel>(_userBox);
    await box.put(user.email, user);
  }

  Future<UserModel?> getUser(String email) async {
    final box = await Hive.openBox<UserModel>(_userBox);
    return box.get(email);
  }

  Future<bool> userExists(String email) async {
    final box = await Hive.openBox<UserModel>(_userBox);
    return box.containsKey(email);
  }

  Future<void> deleteUser(String email) async {
    final box = await Hive.openBox<UserModel>(_userBox);
    await box.delete(email);
  }
}