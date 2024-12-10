import 'package:result_dart/result_dart.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/command/command.dart';
import '../../../../../core/typedefs/types.dart';
import '../../domain/dtos/login_params.dart';
import '../../domain/dtos/register_params.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';

class AuthViewmodel {
  AuthViewmodel({
    required SignUpUsecase signUpUsecase,
    required LoginUsecase loginUsecase,
  })  : _signUpUsecase = signUpUsecase,
        _loginUsecase = loginUsecase,
        super() {
    signUpAction = Command1(_signUpAuth);
    loginAction = Command1(_loginUsecase.call);
  }

  late final Command1<AppResponse<AuthEntity>, RegisterParams> signUpAction;
  late final Command1<AppResponse<AuthEntity>, LoginParams> loginAction;

  late final SignUpUsecase _signUpUsecase;
  late final LoginUsecase _loginUsecase;

  Output<AppResponse<AuthEntity>> _signUpAuth(
      RegisterParams registerParams) async {
    final result = await _signUpUsecase(registerParams)
        .pure(convertToLoginParams(registerParams))

        /// Executa o usecase de Login
        .flatMap(_loginUsecase.call);

    return result;
  }

  LoginParams convertToLoginParams(RegisterParams registerParams) =>
      LoginParams(
        email: registerParams.email,
        password: registerParams.password,
      );
}
