import 'package:adote_um_pet/src/core/errors/errors.dart';

class ServerException extends BaseException {
  @override
  final String message;
  final String error;
  @override
  final String? stackTrace;

  ServerException({
    required this.message,
    required this.error,
    this.stackTrace,
  }) : super(message: message);
}
