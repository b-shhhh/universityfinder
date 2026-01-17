class UserModel {
  final String name;
  final String email;
  final String password;
  final String country;
  final String education;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.country,
    required this.education,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'country': country,
      'education': education,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      country: map['country'] ?? '',
      education: map['education'] ?? '',
    );
  }
}
