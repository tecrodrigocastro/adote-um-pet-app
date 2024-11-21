import 'package:adote_um_pet/src/app/features/auth/domain/entities/auth_entity.dart';
import 'package:adote_um_pet/src/app/features/auth/domain/entities/user_entity.dart';
import 'package:adote_um_pet/src/core/client_http/app_response.dart';
import 'package:adote_um_pet/src/core/typedefs/types.dart';

/// Criar uma interface para o repositório de autenticação
/// para que possamos implementar diferentes repositórios
/// de autenticação, como o FirebaseAuthRepository e o
/// MockAuthRepository.
abstract interface class IAuthRepository {
  Future<Output<AppResponse<AuthEntity>>> login(String email, String password);
  Future<Output<AppResponse<UserEntity>>> signUp({required UserEntity user});
}
