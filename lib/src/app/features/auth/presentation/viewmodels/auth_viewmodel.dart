import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/typedefs/types.dart';
import '../../domain/dtos/login_params.dart';
import '../../domain/dtos/register_params.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';

class AuthViewmodel {
  AuthViewmodel(this._signUpUsecase, this._loginUsecase) {
    signUpCommand = Command1(_signUpAuth);
    loginCommand = Command1(_loginUsecase.call);
  }

  late final Command1<AppResponse<AuthEntity>, RegisterParams> signUpCommand;
  late final Command1<AppResponse<AuthEntity>, LoginParams> loginCommand;

  late final SignUpUsecase _signUpUsecase;
  late final LoginUsecase _loginUsecase;

  Output<AppResponse<AuthEntity>> _signUpAuth(RegisterParams registerParams) =>
      _signUpUsecase(registerParams) // Execute o signUpUsecase
          .pure(convertToLoginParams(registerParams))
          .flatMap(_loginUsecase.call); // Execute o loginUsecase

  LoginParams convertToLoginParams(RegisterParams registerParams) =>
      LoginParams(
        email: registerParams.email,
        password: registerParams.password,
      );
}
