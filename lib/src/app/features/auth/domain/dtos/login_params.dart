final class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  factory LoginParams.empty() => const LoginParams(
        email: '',
        password: '',
      );

  static LoginParams fromJson(Map<String, dynamic> json) => LoginParams(
        email: json['email'],
        password: json['password'],
      );
}
