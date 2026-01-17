import '../../models/auth_hive_model.dart';
import '../local/auth_local_datasource.dart';

abstract interface class IAuthRemoteDatasource {
  Future<AuthHiveModel> login(String email, String password);
  Future<AuthHiveModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
}

// Simple mock remote datasource
class AuthRemoteDatasource implements IAuthRemoteDatasource {
  final IAuthLocalDatasource _localDatasource;

  AuthRemoteDatasource(this._localDatasource);

  @override
  Future<AuthHiveModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate network delay

    final user = await _localDatasource.getUser(email, password);
    if (user != null) {
      return user;
    } else {
      throw Exception('Invalid email or password');
    }
  }

  @override
  Future<AuthHiveModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate network delay

    final newUser = AuthHiveModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: password,
    );

    await _localDatasource.saveUser(newUser);
    return newUser;
  }
}
