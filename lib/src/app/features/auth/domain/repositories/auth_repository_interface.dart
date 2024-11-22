import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/typedefs/types.dart';
import '../entities/auth_entity.dart';
import '../entities/user_entity.dart';

/// Criar uma interface para o repositório de autenticação
/// para que possamos implementar diferentes repositórios
/// de autenticação, como o FirebaseAuthRepository e o
/// MockAuthRepository.
abstract interface class IAuthRepository {
  Future<Output<AppResponse<AuthEntity>>> login(String email, String password);
  Future<Output<AppResponse<UserEntity>>> signUp({required UserEntity user});
}
