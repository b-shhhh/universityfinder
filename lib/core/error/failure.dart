import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// API / Server related failures
class ApiFailure extends Failure {
  const ApiFailure(String message) : super(message);
}

/// Local database (Hive) failures
class LocalFailure extends Failure {
  const LocalFailure(String message) : super(message);
}

/// Network / Internet failures
class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}
