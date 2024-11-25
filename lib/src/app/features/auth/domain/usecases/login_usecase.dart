import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/typedefs/types.dart';
import '../../../../../core/usecase/usecase_interface.dart';
import '../dtos/login_params.dart';
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
