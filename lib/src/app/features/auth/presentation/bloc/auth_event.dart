part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpAuthEvent extends AuthEvent {
  final RegisterParams registerParams;

  const SignUpAuthEvent({
    required this.registerParams,
  });

  @override
  List<Object> get props => [registerParams];
}

class LoginAuthEvent extends AuthEvent {
  final LoginParams loginParams;

  const LoginAuthEvent({
    required this.loginParams,
  });

  @override
  List<Object> get props => [loginParams];
}
