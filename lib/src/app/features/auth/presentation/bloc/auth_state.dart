part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class SignUpAuthLoading extends AuthState {}

class SignUpAuthSuccess extends AuthState {
  final AppResponse<UserEntity> data;

  const SignUpAuthSuccess({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class SignUpAuthFailure extends AuthState {
  final String message;

  const SignUpAuthFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class LoginAuthLoading extends AuthState {}

class LoginAuthSuccess extends AuthState {
  final AppResponse<AuthEntity> data;

  const LoginAuthSuccess({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class LoginAuthFailure extends AuthState {
  final String message;

  const LoginAuthFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
