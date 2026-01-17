import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../providers/auth_provider.dart';
import '../state/auth_state.dart';

class AuthViewModel extends Notifier<AuthState> {
  late final IAuthRepository _authRepository;

  @override
  AuthState build() {
    _authRepository = ref.read(authRepositoryProvider);
    return AuthState.initial();
  }

  Future<void> login({
    required String email,
    required String password,
    void Function(AuthEntity user)? onSuccess,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _authRepository.login(email: email, password: password);
    result.fold(
          (failure) => state = state.copyWith(isLoading: false, error: failure.message),
          (user) {
        state = state.copyWith(isLoading: false, isSuccess: true, user: user);
        if (onSuccess != null) onSuccess(user);
      },
    );
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    void Function(AuthEntity user)? onSuccess,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _authRepository.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
    result.fold(
          (failure) => state = state.copyWith(isLoading: false, error: failure.message),
          (user) {
        state = state.copyWith(isLoading: false, isSuccess: true, user: user);
        if (onSuccess != null) onSuccess(user);
      },
    );
  }
}
