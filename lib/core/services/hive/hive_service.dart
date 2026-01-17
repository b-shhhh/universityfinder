import 'package:hive_flutter/hive_flutter.dart';
import 'package:universityfinder/core/constants/hive_table_constants.dart';
import 'package:universityfinder/features/auth/data/models/auth_hive_model.dart';

class HiveService {
  /// Initialize Hive and register adapters
  Future<void> init() async {
    await Hive.initFlutter();

    // Register the adapter for AuthHiveModel if not already registered
    if (!Hive.isAdapterRegistered(AuthHiveModelAdapter().typeId)) {
      Hive.registerAdapter(AuthHiveModelAdapter());
    }

    // Open user box
    await Hive.openBox<AuthHiveModel>(HiveTableConstants.userTable);
  }

  /// Private getter for user box
  Box<AuthHiveModel> get _userBox =>
      Hive.box<AuthHiveModel>(HiveTableConstants.userTable);

  /// Save the currently logged-in user
  Future<void> saveUser(AuthHiveModel user) async {
    await _userBox.clear(); // Clear old sessions first
    await _userBox.put('currentUser', user);
  }

  /// Get the currently logged-in user (for auto-login)
  AuthHiveModel? getUser() {
    return _userBox.get('currentUser');
  }

  /// Logout the user
  Future<void> logout() async {
    await _userBox.clear();
  }
}
