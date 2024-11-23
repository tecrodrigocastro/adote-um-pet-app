import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';

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

      final result = await _signUpUsecase.call(SignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
        phone: event.phone,
        zipCode: event.zipCode,
        address: event.address,
        numberHouse: event.numberHouse,
        complement: event.complement,
      ));

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
