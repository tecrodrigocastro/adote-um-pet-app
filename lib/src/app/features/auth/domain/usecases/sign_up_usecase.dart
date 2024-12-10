import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/typedefs/types.dart';
import '../../../../../core/usecase/usecase_interface.dart';
import '../dtos/register_params.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository_interface.dart';

class SignUpUsecase
    implements UseCase<AppResponse<UserEntity>, RegisterParams> {
  final IAuthRepository _authRepository;

  SignUpUsecase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Output<AppResponse<UserEntity>> call(RegisterParams params) async {
    return (await _authRepository.signUp(params));
  }
}
