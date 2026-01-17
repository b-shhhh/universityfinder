import '../../domain/entities/auth_entity.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final AuthEntity? user; // logged-in or registered user
  final bool isSuccess;    // true if login/register successful

  const AuthState({
    required this.isLoading,
    this.error,
    this.user,
    required this.isSuccess,
  });

  /// Initial state
  factory AuthState.initial() {
    return const AuthState(
      isLoading: false,
      error: null,
      user: null,
      isSuccess: false,
    );
  }

  /// CopyWith for updating state immutably
  AuthState copyWith({
    bool? isLoading,
    String? error,
    AuthEntity? user,
    bool? isSuccess,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      user: user ?? this.user,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
