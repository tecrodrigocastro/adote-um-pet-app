import 'package:result_dart/result_dart.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/extensions/lucid_validator_extensions.dart';
import '../../../../../core/typedefs/types.dart';
import '../../../../../core/usecase/usecase_interface.dart';
import '../dtos/register_params.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository_interface.dart';
import '../validators/register_params_validator.dart';

class SignUpUsecase
    implements UseCase<AppResponse<UserEntity>, RegisterParams> {
  final IAuthRepository _authRepository;

  SignUpUsecase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Output<AppResponse<UserEntity>> call(RegisterParams params) async {
    final validator = RegisterParamsValidator();

    return await validator

        /// valida o registerParams
        .validateResult(params)

        /// converte em um async Result: Future<Result<...>>
        .toAsyncResult()

        /// Executa o repository de Sign Up
        .flatMap(_authRepository.signUp);
  }
}
