import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUsecase {
  final IAuthRepository repository;

  LoginUsecase(this.repository);

  /// Executes login with email and password.
  /// Returns Either a [Failure] or an [AuthEntity] on success.
  Future<Either<Failure, AuthEntity>> call({
    required String email,
    required String password,
  }) async {
    // Delegates login logic to repository
    return await repository.login(email: email, password: password);
  }
}
