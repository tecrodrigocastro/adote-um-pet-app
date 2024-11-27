import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/errors/base_exception.dart';
import '../../../../../core/extensions/lucid_validator_extensions.dart';
import '../../domain/dtos/login_params.dart';
import '../../domain/dtos/register_params.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/user_entity.dart';
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
          .validateResult(event.registerParams)

          /// valida o registerParams
          .toAsyncResult()

          /// converte em um async Result: Future<Result<...>>
          .flatMap(_signUpUsecase.call)

          /// executa o usecase
          .fold(SignUpAuthSuccess.new, SignUpAuthFailure.new);

      emit(newState);

      // final result = await _signUpUsecase.call(
      //   RegisterParams(
      //     name: event.registerParams.name,
      //     email: event.registerParams.email,
      //     password: event.registerParams.password,
      //     phone: event.registerParams.phone,
      //     zipCode: event.registerParams.zipCode,
      //     address: event.registerParams.address,
      //     numberHouse: event.registerParams.numberHouse,
      //     complement: event.registerParams.complement,
      //   ),
      // );

      // result.fold(
      //   (success) => emit(SignUpAuthSuccess(data: success)),
      //   (error) => emit(SignUpAuthFailure(message: error.toString())),
      // );
    });

    on<LoginAuthEvent>((event, emit) async {
      emit(LoginAuthLoading());
      final validator = LoginParamsValidator();

      final newState = await validator
          .validateResult(event.loginParams)

          /// valida o loginParams
          .toAsyncResult()

          /// converte em um async Result: Future<Result<...>>
          .flatMap(_loginUsecase.call)

          /// executa o usecase
          .fold(LoginAuthSuccess.new, LoginAuthFailure.new);

      /// converte para o estado apropriado

      emit(newState);
    });
  }
}
