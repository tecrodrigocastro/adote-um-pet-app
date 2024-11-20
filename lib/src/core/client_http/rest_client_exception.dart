import 'package:adote_um_pet/src/core/client_http/client_http.dart';
import 'package:adote_um_pet/src/core/errors/errors.dart';

class RestClientException extends BaseException
    implements RestClientHttpMessage {
  dynamic error;
  RestClientResponse? response;

  RestClientException({
    required super.message,
    super.statusCode,
    super.data,
    required this.error,
    this.response,
    super.stackTracing,
  });
}
