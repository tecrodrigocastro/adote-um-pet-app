import 'package:result_dart/result_dart.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/command/command.dart';
import '../../../../../core/extensions/lucid_validator_extensions.dart';
import '../../../../../core/typedefs/types.dart';
import '../../domain/dtos/login_params.dart';
import '../../domain/dtos/register_params.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import '../../domain/validators/login_params_validator.dart';
import '../../domain/validators/register_params_validator.dart';

class AuthViewmodel {
  AuthViewmodel({
    required SignUpUsecase signUpUsecase,
    required LoginUsecase loginUsecase,
  })  : _signUpUsecase = signUpUsecase,
        _loginUsecase = loginUsecase,
        super() {
    signUp = Command1(_signUpAuth);
    login = Command1(_loginAuth);
  }

  late final Command1<AppResponse<AuthEntity>, RegisterParams> signUp;
  late final Command1<AppResponse<AuthEntity>, LoginParams> login;

  late final SignUpUsecase _signUpUsecase;
  late final LoginUsecase _loginUsecase;

  Output<AppResponse<AuthEntity>> _signUpAuth(
      RegisterParams registerParams) async {
    final validator = RegisterParamsValidator();

    final result = await validator

        /// valida o registerParams
        .validateResult(registerParams)

        /// converte em um async Result: Future<Result<...>>
        .toAsyncResult()

        /// Executa o usecase de Sign Up
        .flatMap(_signUpUsecase.call)

        /// transforma o retorno do Result em [LoginParams]
        .pure(
          LoginParams(
            email: registerParams.email,
            password: registerParams.password,
          ),
        )

        /// Executa o usecase de Login
        .flatMap(_loginUsecase.call);

    return result;
  }

  Output<AppResponse<AuthEntity>> _loginAuth(LoginParams loginParams) async {
    final validator = LoginParamsValidator();

    final result = await validator

        /// valida o loginParams
        .validateResult(loginParams)

        /// converte em um async Result: Future<Result<...>>
        .toAsyncResult()

        /// executa o usecase
        .flatMap(_loginUsecase.call);

    return result;
  }
}
