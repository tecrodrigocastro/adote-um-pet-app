import 'dart:developer';

import 'package:result_dart/result_dart.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/extensions/lucid_validator_extensions.dart';
import '../../../../../core/services/session_service.dart';
import '../../../../../core/typedefs/types.dart';
import '../../../../../core/usecase/usecase_interface.dart';
import '../dtos/login_params.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository_interface.dart';
import '../validators/login_params_validator.dart';

class LoginUsecase implements UseCase<AppResponse<AuthEntity>, LoginParams> {
  final IAuthRepository _authRepository;
  final SessionService _sessionService;

  LoginUsecase(
      {required IAuthRepository authRepository,
      required SessionService sessionService})
      : _authRepository = authRepository,
        _sessionService = sessionService;

  @override
  Output<AppResponse<AuthEntity>> call(LoginParams params) async {
    final validator = LoginParamsValidator();

    final result = await validator

        /// valida o loginParams
        .validateResult(params)

        /// converte em um async Result: Future<Result<...>>
        .toAsyncResult()

        /// executa o respository
        .flatMap(_authRepository.login);

    final appResponse = result.getOrNull();

    if (result.isSuccess() && appResponse != null) {
      log('Token: ${appResponse.data!.accessToken}');
      _sessionService.saveToken(appResponse.data!.accessToken);
    }

    return result;
  }
}
