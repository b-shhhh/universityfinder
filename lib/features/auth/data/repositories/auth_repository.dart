import 'package:universityfinder/features/auth/datasources/local/auth_local_datasource.dart';
import '../models/user_model.dart';

class AuthResult {
  final bool success;
  final String? message;

  AuthResult(this.success, {this.message});
}

class AuthRepository {
  final AuthLocalDatasource datasource;

  AuthRepository(this.datasource);

  /// Register a new user
  Future<AuthResult> register(UserModel user) async {
    try {
      final exists = await datasource.userExists(user.email);
      if (exists) return AuthResult(false, message: "Email already registered");

      await datasource.saveUser(user);
      return AuthResult(true);
    } catch (e) {
      return AuthResult(false, message: "Failed to save user: ${e.toString()}");
    }
  }

  /// Login with email and password
  Future<AuthResult> login(String email, String password) async {
    try {
      final user = await datasource.getUser(email);
      if (user == null) return AuthResult(false, message: "User not found");
      if (user.password != password) return AuthResult(false, message: "Incorrect password");

      return AuthResult(true);
    } catch (e) {
      return AuthResult(false, message: "Login failed: ${e.toString()}");
    }
  }
}
