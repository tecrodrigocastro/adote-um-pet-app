import 'dart:developer';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/services/session_service.dart';
import '../../../../../core/typedefs/types.dart';
import '../../../../../core/usecase/usecase_interface.dart';
import '../dtos/login_params.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository_interface.dart';

class LoginUsecase implements UseCase<AppResponse<AuthEntity>, LoginParams> {
  final IAuthRepository _authRepository;
  final SessionService _sessionService;

  LoginUsecase(
      {required IAuthRepository authRepository,
      required SessionService sessionService})
      : _authRepository = authRepository,
        _sessionService = sessionService;

  @override
  Future<Output<AppResponse<AuthEntity>>> call(LoginParams params) async {
    final result = await _authRepository.login(params);

    final appResponse = result.getOrNull();

    if (result.isSuccess() && appResponse != null) {
      log('Token: ${appResponse.data!.accessToken}');
      _sessionService.saveToken(appResponse.data!.accessToken);
    }

    return result;
  }
}
