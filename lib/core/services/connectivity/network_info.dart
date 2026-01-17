import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Interface for network info
abstract interface class INetworkInfo {
  Future<bool> get isConnected;
}

/// Riverpod provider for network info
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfo(Connectivity());
});

/// Implementation of INetworkInfo
class NetworkInfo implements INetworkInfo {
  final Connectivity _connectivity;

  NetworkInfo(this._connectivity);

  /// Checks if device has a network connection (WiFi or mobile)
  @override
  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) return false;

    // Optional: check if internet really works
    // return await _hasInternetConnection();
    return true;
  }

  /// Optional: verify actual internet connectivity
  Future<bool> _hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
