import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/entities/auth_entity.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: 0)
class AuthHiveModel {
  @HiveField(0)
  final String firstName;

  @HiveField(1)
  final String lastName;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String birthDate;

  @HiveField(4)
  final String gender;

  @HiveField(5)
  final String phoneNumber;

  @HiveField(6)
  final String education;

  @HiveField(7)
  final String password;

  @HiveField(8)
  final String confirmPassword;

  AuthHiveModel({
    String? firstName,
    String? lastName,
    String? email,
    String? birthDate,
    String? gender,
    String? phoneNumber,
    String? education,
    String? password,
    String? confirmPassword,
  })  : firstName = firstName ?? '',
        lastName = lastName ?? '',
        email = email ?? '',
        birthDate = birthDate ?? '',
        gender = gender ?? '',
        phoneNumber = phoneNumber ?? '',
        education = education ?? '',
        password = password ?? '',
        confirmPassword = confirmPassword ?? '';

  /// Convert from AuthEntity
  factory AuthHiveModel.fromEntity(AuthEntity entity, {String? password, String? confirmPassword}) {
    return AuthHiveModel(
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      birthDate: entity.birthDate,
      gender: entity.gender,
      phoneNumber: entity.phoneNumber,
      education: entity.education,
      password: password ?? '',
      confirmPassword: confirmPassword ?? '',
    );
  }

  /// Convert to AuthEntity (excluding password)
  AuthEntity toEntity() {
    return AuthEntity(
      firstName: firstName,
      lastName: lastName,
      email: email,
      birthDate: birthDate,
      gender: gender,
      phoneNumber: phoneNumber,
      education: education, password: '', confirmPassword: '',
    );
  }
}
