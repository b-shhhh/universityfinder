import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String _loginBox = 'loginBox';

  static Future<void> init() async {
    await Hive.initFlutter();
  }

  Future<void> saveLogin(String email) async {
    var box = await Hive.openBox(_loginBox);
    await box.put('email', email);
  }

  Future<String?> getLogin() async {
    var box = await Hive.openBox(_loginBox);
    return box.get('email');
  }

  Future<void> logout() async {
    var box = await Hive.openBox(_loginBox);
    await box.delete('email');
  }
}
