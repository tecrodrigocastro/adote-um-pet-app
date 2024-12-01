import 'dart:async';

import 'package:result_dart/result_dart.dart';

import '../../../../../core/client_http/client_http.dart';
import '../../../../../core/services/session_service.dart';

class AuthInterceptor implements IClientInterceptor {
  final SessionService _sessionService;

  AuthInterceptor({
    required SessionService sessionService,
  }) : _sessionService = sessionService;

  @override
  Future<RestClientRequest> onRequest(RestClientRequest request) async {
    final token = await _sessionService.getToken();

    if (token != null && token.isNotEmpty) {
      return Success(token) //
          .map((token) => 'Bearer $token')
          .map((str) => request..headers?.addAll({'Authorization': str}))
          .getOrDefault(request);
    }

    return request;
  }

  @override
  FutureOr<RestClientHttpMessage> onResponse(RestClientResponse response) {
    return response;
  }

  @override
  FutureOr<RestClientHttpMessage> onError(RestClientException error) async {
    // TODO: implement refresh token logic
    return error;
  }
}
