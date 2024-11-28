import '../../../../../core/client_http/client_http.dart';
import '../../../../../core/client_http/dio/rest_client_dio_impl.dart';
import '../models/request/login_model.dart';
import '../models/request/register_model.dart';

class AuthRemoteDatasource {
  final RestClientDioImpl _restClient;

  AuthRemoteDatasource({
    required RestClientDioImpl restClientDioImpl,
  }) : _restClient = restClientDioImpl;

  Future<RestClientResponse> register(RegisterModel model) => //
      _restClient.post(RestClientRequest(
        path: '/auth/register',
        data: model.toMap(),
      ));

  Future<RestClientResponse> login(LoginModel model) => //
      _restClient.post(RestClientRequest(
        path: '/auth/login',
        data: model.toMap(),
      ));

  Future<RestClientResponse> logout() => //
      _restClient.post(RestClientRequest(path: '/auth/logout'));

  Future<RestClientResponse> refresh() => //
      _restClient.post(RestClientRequest(path: '/auth/refresh'));
}
