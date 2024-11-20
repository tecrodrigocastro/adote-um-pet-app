import 'package:adote_um_pet/src/app/features/auth/domain/entities/user_entity.dart';
import 'package:adote_um_pet/src/app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUsecase _signUpUsecase;
  AuthBloc({
    required SignUpUsecase signUpUsecase,
  })  : _signUpUsecase = signUpUsecase,
        super(AuthInitial()) {
    on<SignUpAuthEvent>((event, emit) async {
      emit(SignUpAuthLoading());

      final result = await _signUpUsecase.call(SignUpParams(user: event.user));

      result.fold(
        (error) => emit(SignUpAuthFailure(message: error.toString())),
        (success) => emit(SignUpAuthSuccess(user: success)),
      );
    });
  }
}
