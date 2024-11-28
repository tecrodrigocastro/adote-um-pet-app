import '../../../../../core/client_http/client_http.dart';
import '../../../../../core/client_http/rest_client_multipart.dart';

class AuthRemoteDatasource implements IRestClient {
  final IRestClient _restClientDioImpl;

  AuthRemoteDatasource({
    required IRestClient restClientDioImpl,
  }) : _restClientDioImpl = restClientDioImpl;

  @override
  void addInterceptors(IClientInterceptor interceptor) {
    _restClientDioImpl.addInterceptors(interceptor);
  }

  @override
  Future<RestClientResponse> delete(RestClientRequest request) async {
    return _restClientDioImpl.delete(request);
  }

  @override
  Future<RestClientResponse> get(RestClientRequest request) async {
    return _restClientDioImpl.get(request);
  }

  @override
  Future<RestClientResponse> patch(RestClientRequest request) async {
    return _restClientDioImpl.patch(request);
  }

  @override
  Future<RestClientResponse> post(RestClientRequest request) async {
    return _restClientDioImpl.post(request);
  }

  @override
  Future<RestClientResponse> put(RestClientRequest request) async {
    return _restClientDioImpl.put(request);
  }

  @override
  void removeInterceptors(IClientInterceptor interceptor) {
    _restClientDioImpl.removeInterceptors(interceptor);
  }

  @override
  Future<RestClientResponse> upload(RestClientMultipart multipart) async {
    return _restClientDioImpl.upload(multipart);
  }
}
