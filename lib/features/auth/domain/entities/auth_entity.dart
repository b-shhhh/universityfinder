import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String birthDate;
  final String gender;
  final String phoneNumber;
  final String education;
  final String password;
  final String confirmPassword;


  const AuthEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthDate,
    required this.gender,
    required this.phoneNumber,
    required this.education,
    required this.password,
    required this.confirmPassword,

  });

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    birthDate,
    gender,
    phoneNumber,
    education,
    password,
    confirmPassword,
  ];
}
