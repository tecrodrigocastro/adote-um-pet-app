import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/errors/base_exception.dart';
import '../../../../../core/extensions/lucid_validator_extensions.dart';
import '../../domain/dtos/login_params.dart';
import '../../domain/dtos/register_params.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import '../../domain/validators/login_params_validator.dart';
import '../../domain/validators/register_params_validator.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUsecase _signUpUsecase;
  final LoginUsecase _loginUsecase;
  AuthBloc({
    required SignUpUsecase signUpUsecase,
    required LoginUsecase loginUsecase,
  })  : _signUpUsecase = signUpUsecase,
        _loginUsecase = loginUsecase,
        super(AuthInitial()) {
    on<SignUpAuthEvent>((event, emit) async {
      emit(SignUpAuthLoading());

      final validator = RegisterParamsValidator();

      final newState = await validator

          /// valida o registerParams
          .validateResult(event.registerParams)

          /// converte em um async Result: Future<Result<...>>
          .toAsyncResult()

          /// Executa o usecase de Sign Up
          .flatMap(_signUpUsecase.call)

          /// transforma o retorno do Result em [LoginParams]
          .pure(
            LoginParams(
              email: event.registerParams.email,
              password: event.registerParams.password,
            ),
          )

          /// Executa o usecase de Login
          .flatMap(_loginUsecase.call)

          /// converte para o estado apropriado
          .fold(SignUpAuthSuccess.new, SignUpAuthFailure.new);

      emit(newState);
    });

    on<LoginAuthEvent>((event, emit) async {
      emit(LoginAuthLoading());
      final validator = LoginParamsValidator();

      final newState = await validator

          /// valida o loginParams
          .validateResult(event.loginParams)

          /// converte em um async Result: Future<Result<...>>
          .toAsyncResult()

          /// executa o usecase
          .flatMap(_loginUsecase.call)

          /// converte para o estado apropriado
          .fold(LoginAuthSuccess.new, LoginAuthFailure.new);

      emit(newState);
    });
  }
}
