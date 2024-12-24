import '../../app/features/auth/data/models/reponse/user_model.dart';
import '../../app/features/auth/domain/entities/user_entity.dart';
import '../cache/cache.dart';
import '../cache/shared_preferences/shared_preferences_impl.dart';

class SessionService {
  final SharedPreferencesImpl _sharedPreferences;

  SessionService({
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

  Future<bool> removeToken() async {
    return await _sharedPreferences.removeData('token');
  }

  Future<bool> saveUser(UserEntity user) async {
    final response = await _sharedPreferences.setData(
      params: CacheParams(key: 'user', value: user),
    );

    return response;
  }

  Future<UserEntity?> getUser() async {
    final response = await _sharedPreferences.getData('user');

    if (response == null) {
      return null;
    }

    return UserModel.fromJson(response);
  }

  Future<bool> removeUser() async {
    return await _sharedPreferences.removeData('user');
  }

  Future<bool> isUserLoggedIn() async {
    UserEntity? user = await getUser();
    return user != null;
  }
}
