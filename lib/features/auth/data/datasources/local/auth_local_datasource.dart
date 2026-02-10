import '../../../../../core/services/hive/hive_service.dart';
import '../../models/auth_hive_model.dart';

abstract interface class IAuthLocalDatasource {
  Future<void> saveUser(AuthHiveModel user);
  Future<AuthHiveModel?> getUser(String email, String password);
  Future<void> logout();
}

class AuthLocalDatasource implements IAuthLocalDatasource {
  final HiveService _hiveService;

  AuthLocalDatasource(this._hiveService);

  @override
  Future<void> saveUser(AuthHiveModel user) async {
    await _hiveService.saveUser(user);
  }

  @override
  Future<AuthHiveModel?> getUser(String email, String password) async {
    final user = _hiveService.getUser();
    if (user != null && user.email == email && user.password == password) {
      return user;
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await _hiveService.logout();
  }
}
