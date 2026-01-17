class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = "http://10.0.2.2:5000/api/";

  // Auth Endpoints
  static const String login = "auth/login";
  static const String register = "auth/register";

  static const Duration connectionTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
}
