import 'errors.dart';

class ServerException extends BaseException {
  @override
  final String message;
  final String error;
  final String? stackTrace;

  ServerException({
    required this.message,
    required this.error,
    this.stackTrace,
  }) : super(message: message);
}
