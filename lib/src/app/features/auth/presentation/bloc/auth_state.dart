part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class SignUpAuthLoading extends AuthState {}

class SignUpAuthSuccess extends AuthState {
  final UserEntity user;

  const SignUpAuthSuccess({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class SignUpAuthFailure extends AuthState {
  final String message;

  const SignUpAuthFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
