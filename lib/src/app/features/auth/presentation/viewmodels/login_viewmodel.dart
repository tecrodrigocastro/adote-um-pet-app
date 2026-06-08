import 'package:flutter/material.dart';
import 'package:signal_form/signal_form.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/command/command.dart';
import '../../domain/dtos/login_params.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginViewmodel {
  LoginViewmodel({required this.loginUsecase}) {
    loginCommand = Command1(loginUsecase.call);
  }

  late final Command1<AppResponse<AuthEntity>, LoginParams> loginCommand;
  final LoginUsecase loginUsecase;

  final isPasswordVisible = ValueNotifier(false);

  late final form = formCtrl(() => (
        email: Field<String>('email')
            .required(message: 'O e-mail não pode estar vazio')
            .email(message: 'O e-mail informado é inválido'),
        password: Field<String>('password')
            .required(message: 'A senha não pode estar vazia')
            .minLength(8, message: 'A senha deve ter no mínimo 8 caracteres'),
      ));

  void onSubmit() => form.submit((ctrl) {
        final f = ctrl.fields;
        loginCommand.execute(LoginParams(
          email: f.email.text,
          password: f.password.text,
        ));
      });

  void togglePasswordVisibility() =>
      isPasswordVisible.value = !isPasswordVisible.value;
}
