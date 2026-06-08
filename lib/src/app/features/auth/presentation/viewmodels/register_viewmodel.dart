import 'package:flutter/material.dart';
import 'package:signal_form/signal_form.dart';

import '../../../../../core/client_http/app_response.dart';
import '../../../../../core/command/command.dart';
import '../../../../../core/enums/user_type_enum.dart';
import '../../../../../core/extensions/signal_form_extensions.dart';
import '../../domain/dtos/register_params.dart' show RegisterParams;
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/sign_up_usecase.dart';

class RegisterViewmodel {
  RegisterViewmodel({required this.signUpUsecase}) {
    signUpCommand = Command1(signUpUsecase.call);
  }

  late final Command1<AppResponse<UserEntity>, RegisterParams> signUpCommand;
  final SignUpUsecase signUpUsecase;

  final isPasswordVisible = ValueNotifier(false);
  final isConfirmPasswordVisible = ValueNotifier(false);

  late final form = formCtrl(() => (
        // --- Conta ---
        userType: Field<UserType>('userType', UserType.individual),
        name: Field<String>('name')
            .required(message: 'O nome não pode estar vazio')
            .minLength(3, message: 'O nome deve ter no mínimo 3 caracteres'),
        email: Field<String>('email').customValidEmail(),
        phone: Field<String>('phone').customValidPhone(),
        photoUrl:
            Field<String>('photoUrl').httpUrl(message: 'URL de foto inválida'),

        // --- Senha ---
        password: Field<String>('password').customValidPassword(),
        confirmPassword:
            Field<String>('confirmPassword').customConfirmPassword(),

        // --- Endereço ---
        address: formGroup(
            'address',
            () => (
                  zipCode: Field<String>('zipCode').customValidCEP(),
                  street: Field<String>('street')
                      .required(message: 'A rua não pode estar vazia'),
                  neighborhood: Field<String>('neighborhood')
                      .required(message: 'O bairro não pode estar vazio'),
                  numberHouse: Field<String>('numberHouse')
                      .required(message: 'O número não pode estar vazio'),
                  complement: Field<String>('complement'),
                  city: Field<String>('city')
                      .required(message: 'A cidade não pode estar vazia'),
                  state: Field<String>('state')
                      .required(message: 'O estado não pode estar vazio')
                      .length(2, message: 'Use a sigla do estado (ex: SP)'),
                )),

        // --- Organização (validação ativada apenas quando userType == organization) ---
        organization: formGroup(
          'organization',
          () => (
            organizationName: Field<String>('organizationName').required(
                message: 'O nome da organização não pode estar vazio'),
            cnpj: Field<String>('cnpj').customValidCNPJ(),
            responsibleName: Field<String>('responsibleName').required(
                message: 'O nome do responsável não pode estar vazio'),
            missionStatement: Field<String>('missionStatement').required(
                message: 'A missão da organização não pode estar vazia'),
            website: Field<String>('website')
                .httpUrl(message: 'URL do site inválida'),
            facebook:
                Field<String>('facebook').httpUrl(message: 'URL inválida'),
            instagram:
                Field<String>('instagram').httpUrl(message: 'URL inválida'),
            twitter: Field<String>('twitter').httpUrl(message: 'URL inválida'),
          ),
          applyWhen: (valueOf) =>
              valueOf<UserType>('userType').value == UserType.organization,
        ),
      ));

  void onSubmit() => form.submit(
        (ctrl) => signUpCommand.execute(
          RegisterParams.fromMap(ctrl.toJson()),
        ),
      );

  void togglePasswordVisibility() =>
      isPasswordVisible.value = !isPasswordVisible.value;
}
