import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUsecase {
  final IAuthRepository repository;

  RegisterUsecase(this.repository);

  /// Executes registration with user details.
  /// Returns Either a [Failure] or an [AuthEntity] on success.
  Future<Either<Failure, AuthEntity>> call({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    return await repository.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
  }
}
