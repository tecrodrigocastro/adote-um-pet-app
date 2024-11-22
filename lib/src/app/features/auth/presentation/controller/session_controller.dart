import '../../../../../core/cache/cache_params.dart';
import '../../../../../core/cache/shared_preferences/shared_preferences_impl.dart';

class SessionController {
  final SharedPreferencesImpl _sharedPreferences;

  SessionController({
    required SharedPreferencesImpl sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  Future<bool> saveToken(String token) async {
    final response = await _sharedPreferences.setData(
      params: CacheParams(key: 'token', value: token),
    );

    return response;
  }

  Future<String?> getToken() async {
    final response = await _sharedPreferences.getData('token');

    if (response == null) {
      return null;
    }

    return response as String;
  }
}
