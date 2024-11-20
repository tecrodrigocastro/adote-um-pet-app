import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  static final String baseUrl = dotenv.env['BASE_URL'] ?? '';
  static const String prefix = '/api';
  static const String login = '$prefix/auth/login';
  static const String register = '$prefix/auth/register';
}
