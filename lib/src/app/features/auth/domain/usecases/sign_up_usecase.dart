import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/typedefs/types.dart';
import '../../../../../core/usecase/usecase_interface.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository_interface.dart';

class SignUpUsecase implements UseCase<AppResponse<UserEntity>, SignUpParams> {
  final IAuthRepository _authRepository;

  SignUpUsecase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Output<AppResponse<UserEntity>>> call(SignUpParams params) async {
    return await _authRepository.signUp(user: params.user);
  }
}

class SignUpParams {
  final UserEntity user;

  SignUpParams({
    required this.user,
  });
}
