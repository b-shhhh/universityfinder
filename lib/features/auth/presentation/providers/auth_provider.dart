import 'package:hive/hive.dart';
import 'package:universityfinder/features/auth/data/models/user_model.dart';

class AuthRepository {
  static const String _boxName = 'usersBox';

  Future<Box> _openBox() async {
    return await Hive.openBox(_boxName);
  }

  Future<bool> register(UserModel user) async {
    final box = await _openBox();

    final exists = box.values.any((u) => u['email'] == user.email);
    if (exists) return false;

    await box.add(user.toMap());
    return true;
  }

  Future<bool> login(UserModel user) async {
    final box = await _openBox();

    final match = box.values.any(
          (u) => u['email'] == user.email && u['password'] == user.password,
    );
    return match;
  }

  Future<UserModel?> getUserByEmail(String email) async {
    final box = await _openBox();
    try {
      final map = box.values.firstWhere((u) => u['email'] == email);
      return UserModel.fromMap(Map<String, dynamic>.from(map));
    } catch (e) {
      return null;
    }
  }
}
