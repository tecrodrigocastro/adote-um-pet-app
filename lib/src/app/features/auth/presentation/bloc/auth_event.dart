part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpAuthEvent extends AuthEvent {
  final UserEntity user;

  const SignUpAuthEvent({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class LoginAuthEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginAuthEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
