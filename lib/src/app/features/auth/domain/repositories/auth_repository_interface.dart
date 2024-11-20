import 'package:adote_um_pet/src/app/features/auth/domain/entities/user_entity.dart';
import 'package:adote_um_pet/src/core/typedefs/types.dart';

/// Criar uma interface para o repositório de autenticação
/// para que possamos implementar diferentes repositórios
/// de autenticação, como o FirebaseAuthRepository e o
/// MockAuthRepository.
abstract interface class IAuthRepository {
  Future<Output<UserEntity>> signUp({
    required UserEntity user,
  });
}
