import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/show_snack_bar.dart';
import '../../../../../routes.dart';
import '../../domain/dtos/register_params.dart';
import '../../domain/validators/register_params_validator.dart';
import '../viewmodels/auth_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  MaskedTextController numberController =
      MaskedTextController(mask: '(00) 00000-0000');
  MaskedTextController cepController = MaskedTextController(mask: '00000-000');

  final _registerParams = RegisterParams.empty();
  final _validator = RegisterParamsValidator();

  final formKey = GlobalKey<FormState>();

  final authViewmodel = GetIt.I.get<AuthViewmodel>();

  @override
  void initState() {
    super.initState();
    authViewmodel.signUpAction.addListener(listener);
  }

  listener() {
    authViewmodel.signUpAction.result?.fold(
      (appResponse) {
        formKey.currentState!.reset();
        showMessageSnackBar(
          context,
          appResponse.message,
          icon: Icons.check,
          iconColor: AppColors.whiteColor,
          color: AppColors.secondaryColor,
        );
        router.go('/auth/welcome');
      },
      (exception) {
        showMessageSnackBar(
          context,
          exception.message,
          icon: Icons.error,
          iconColor: AppColors.whiteColor,
          color: AppColors.primaryColor,
        );
      },
    );
  }

  @override
  void dispose() {
    authViewmodel.signUpAction.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(17),
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: theme.textTheme.displaySmall,
                ),
                const Gap(29),
                TextInputDs(
                  label: 'nome',
                  width: size.width,
                  onChanged: _registerParams.setName,
                  validator: _validator.byField(_registerParams, 'name'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const Gap(25),
                TextInputDs(
                  label: 'e-mail',
                  textInputType: TextInputType.emailAddress,
                  width: size.width,
                  onChanged: _registerParams.setEmail,
                  validator: _validator.byField(_registerParams, 'email'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const Gap(25),
                TextInputDs(
                  width: size.width,
                  label: 'senha',
                  isPassword: true,
                  onChanged: _registerParams.setPassword,
                  validator: _validator.byField(_registerParams, 'password'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const Gap(25),
                TextInputDs(
                  width: size.width,
                  label: 'confirmar senha',
                  isPassword: true,
                  onChanged: _registerParams.setConfirmPassword,
                  validator:
                      _validator.byField(_registerParams, 'confirmPassword'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const Gap(25),
                TextInputDs(
                  label: 'telefone',
                  controller: numberController,
                  textInputType: TextInputType.number,
                  width: size.width,
                  onChanged: _registerParams.setPhone,
                  validator: _validator.byField(_registerParams, 'phone'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const Gap(25),
                TextInputDs(
                  label: 'cep',
                  controller: cepController,
                  textInputType: TextInputType.number,
                  width: size.width,
                  onChanged: _registerParams.setZipCode,
                  validator: _validator.byField(_registerParams, 'zipCode'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const Gap(25),
                TextInputDs(
                  label: 'Endereço',
                  textInputType: TextInputType.number,
                  width: size.width,
                  onChanged: _registerParams.setAddress,
                  validator: _validator.byField(_registerParams, 'address'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const Gap(25),
                Row(
                  children: [
                    TextInputDs(
                      label: 'Número',
                      textInputType: TextInputType.number,
                      width: size.width * 0.3,
                      onChanged: _registerParams.setNumberHouse,
                      validator: _validator.byField(_registerParams, 'number'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const Gap(10),
                    Flexible(
                      child: TextInputDs(
                        label: 'Complemento',
                        textInputType: TextInputType.number,
                        width: size.width * 0.59,
                        onChanged: _registerParams.setComplement,
                        validator:
                            _validator.byField(_registerParams, 'complement'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ],
                ),
                const Gap(40),
                Align(
                  alignment: Alignment.center,
                  child: ListenableBuilder(
                    listenable: authViewmodel.signUpAction,
                    builder: (context, _) {
                      return PrimaryButtonDs(
                        title: 'Cadastrar',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            authViewmodel.signUpAction.execute(_registerParams);
                          }
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
