import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  static final String baseUrl = dotenv.env['BASE_URL'] ?? '';
  static final String baseUrlDev = dotenv.env['BASE_URL_DEV'] ?? '';
  static const String prefix = '/api';

  // Auth
  static const String login = '$prefix/auth/login';
  static const String register = '$prefix/auth/register';
  static String updatePhotoUser<T>(T userId) {
    return '$prefix/users/update-photo/$userId';
  }
}
