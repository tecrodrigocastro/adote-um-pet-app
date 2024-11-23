part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpAuthEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String zipCode;
  final String address;
  final int numberHouse;
  final String complement;

  const SignUpAuthEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.zipCode,
    required this.address,
    required this.numberHouse,
    required this.complement,
  });

  @override
  List<Object> get props =>
      [name, email, password, phone, zipCode, address, numberHouse, complement];
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
