import 'package:shared_preferences/shared_preferences.dart';
import 'package:universityfinder/features/auth/data/models/auth_hive_model.dart';
import 'package:universityfinder/core/services/hive/hive_service.dart';

class UserSessionService {
  final HiveService _hiveService = HiveService();

  /// Save user after login/register
  Future<void> saveUser(AuthHiveModel user) async {
    // Save full user info in Hive
    await _hiveService.saveUser(user);
  }

  /// Get logged-in user
  Future<AuthHiveModel?> getUser() async {
    return _hiveService.getUser();
  }

  /// Check if user is logged in
  Future<bool> isLoggedIn() async {
    final user = await getUser();
    return user != null;
  }

  /// Clear session on logout
  Future<void> clearSession() async {
    await _hiveService.logout();

  }
}