import 'package:Uniguide/core/services/storage/storage_service.dart';

class UserSessionService {
  final StorageService storage;

  UserSessionService(this.storage);

  Future<void> saveToken(String token) async {
    await storage.saveString('token', token);
  }

  Future<bool> isLoggedIn() async {
    final token = await storage.getString('token');
    return token != null;
  }

  Future<void> logout() async {
    await storage.clear();
  }
}
