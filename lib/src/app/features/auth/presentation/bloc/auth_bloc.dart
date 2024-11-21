import 'package:adote_um_pet/src/app/features/auth/domain/entities/auth_entity.dart';
import 'package:adote_um_pet/src/app/features/auth/domain/entities/user_entity.dart';
import 'package:adote_um_pet/src/app/features/auth/domain/usecases/login_usecase.dart';
import 'package:adote_um_pet/src/app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:adote_um_pet/src/core/client_http/app_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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

      final result = await _signUpUsecase.call(SignUpParams(user: event.user));

      result.fold(
        (error) => emit(SignUpAuthFailure(message: error.toString())),
        (success) => emit(SignUpAuthSuccess(data: success)),
      );
    });

    on<LoginAuthEvent>((event, emit) async {
      emit(LoginAuthLoading());

      final result = await _loginUsecase.call(LoginParams(
        email: event.email,
        password: event.password,
      ));

      result.fold(
        (error) => emit(LoginAuthFailure(message: error.message)),
        (success) => emit(LoginAuthSuccess(data: success)),
      );
    });
  }
}
