import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/typedefs/types.dart';
import '../../../../../core/usecase/usecase_interface.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository_interface.dart';

class LoginUsecase implements UseCase<AppResponse<AuthEntity>, LoginParams> {
  final IAuthRepository _authRepository;

  LoginUsecase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Output<AppResponse<AuthEntity>>> call(LoginParams params) async {
    return _authRepository.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
