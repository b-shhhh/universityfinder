// core/common/provider/common_provider.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api_client.dart';
import '../services/hive/hive_service.dart';
import '../services/storage/user_info.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final apiClientProvider = Provider<ApiClient>((ref) {
  final dio = ref.read(dioProvider);
  return ApiClient(dio);
});

final userSessionServiceProvider = Provider<UserSessionService>((ref) {
  return UserSessionService();
});

final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());