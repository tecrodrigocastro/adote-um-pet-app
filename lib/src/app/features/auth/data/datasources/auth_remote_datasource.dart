import '../../../../../core/client_http/client_http.dart';
import '../../../../../core/utils/end_points.dart';
import '../models/request/login_model.dart';
import '../models/request/register_model.dart';

class AuthRemoteDatasource {
  final IRestClient _restClient;

  AuthRemoteDatasource({
    required IRestClient restClient,
  }) : _restClient = restClient;

  Future<RestClientResponse> register(RegisterModel model) => //
      _restClient.post(RestClientRequest(
        path: EndPoints.register,
        data: model.toMap(),
      ));

  Future<RestClientResponse> login(LoginModel model) => //
      _restClient.post(RestClientRequest(
        path: EndPoints.login,
        data: model.toMap(),
      ));

  Future<RestClientResponse> logout() => //
      _restClient.post(RestClientRequest(path: '/auth/logout'));

  Future<RestClientResponse> refresh() => //
      _restClient.post(RestClientRequest(path: '/auth/refresh'));
}
