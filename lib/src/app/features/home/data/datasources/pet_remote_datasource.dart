import '../../../../../core/client_http/client_http.dart';

class PetRemoteDatasource {
  final IRestClient _restClient;

  PetRemoteDatasource({
    required IRestClient restClient,
  }) : _restClient = restClient;

  Future<RestClientResponse> getPets() {
    return _restClient.get(RestClientRequest(path: '/pets'));
  }
}
