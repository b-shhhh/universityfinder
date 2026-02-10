import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/auth_entity.dart';

abstract interface class IAuthRepository {
  /// Login user with email & password
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  });

  /// Register new user
  Future<Either<Failure, AuthEntity>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
}
