import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/common_provider.dart';
import '../../data/datasources/local/auth_local_datasource.dart';
import '../../data/datasources/remote/auth_remote_datasource.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/repositories/auth_repositoryimpl.dart';
import '../state/auth_state.dart';
import '../view model/auth_viewmodel.dart';

// 1️⃣ Local datasource
final authLocalDatasourceProvider = Provider<IAuthLocalDatasource>((ref) {
  final hiveService = ref.read(hiveServiceProvider);
  return AuthLocalDatasource(hiveService);
});

// 2️⃣ Remote datasource
final authRemoteDatasourceProvider = Provider<IAuthRemoteDatasource>((ref) {
  final localDatasource = ref.read(authLocalDatasourceProvider);
  return AuthRemoteDatasource(localDatasource);
});

// 3️⃣ Repository
final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  final remote = ref.read(authRemoteDatasourceProvider);
  final local = ref.read(authLocalDatasourceProvider);
  return AuthRepositoryImpl(remote, local); // ✅ Returns IAuthRepository
});

// 4️⃣ ViewModel
final authViewModelProvider = NotifierProvider<AuthViewModel, AuthState>(
      () => AuthViewModel(),
);
