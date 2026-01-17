import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local/auth_local_datasource.dart';
import '../datasources/remote/auth_remote_datasource.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthRemoteDatasource _remoteDatasource;
  final IAuthLocalDatasource _localDatasource;

  AuthRepositoryImpl(this._remoteDatasource, this._localDatasource);

  /// Login user with email & password
  @override
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      // Call remote datasource
      final userModel = await _remoteDatasource.login(email, password);

      if (userModel == null) {
        return Left(ApiFailure('Invalid email or password'));
      }

      // Save locally
      await _localDatasource.saveUser(userModel);

      // Return domain entity
      return Right(userModel.toEntity());
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  /// Register new user
  @override
  Future<Either<Failure, AuthEntity>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      // Call remote datasource
      final userModel = await _remoteDatasource.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );

      // Save locally
      await _localDatasource.saveUser(userModel);

      // Return domain entity
      return Right(userModel.toEntity());
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
