import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/show_snack_bar.dart';
import '../../domain/dtos/login_params.dart';
import '../../domain/validators/login_params_validator.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginParams = LoginParams.empty();
  final _validator = LoginParamsValidator();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final authBloc = GetIt.I.get<AuthBloc>();

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
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(image: AppImages.logo),
                const Gap(50),
                TextInputDs(
                  label: 'e-mail',
                  onChanged: _loginParams.setEmail,
                  validator: _validator.byField(_loginParams, 'email'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const Gap(20),
                TextInputDs(
                  label: 'senha',
                  isPassword: true,
                  onChanged: _loginParams.setPassword,
                  validator: _validator.byField(_loginParams, 'password'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const Gap(25),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is LoginAuthSuccess) {
                      formKey.currentState!.reset();
                      showMessageSnackBar(
                        context,
                        state.data.message,
                        icon: Icons.check,
                        color: AppColors.secondaryColor,
                        iconColor: AppColors.whiteColor,
                      );
                    }
                    if (state is LoginAuthFailure) {
                      showMessageSnackBar(
                        context,
                        state.message,
                        icon: Icons.error,
                        iconColor: AppColors.whiteColor,
                        color: AppColors.primaryColor,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginAuthLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return PrimaryButtonDs(
                      title: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          authBloc.add(
                            LoginAuthEvent(loginParams: _loginParams),
                          );
                        }
                      },
                    );
                  },
                ),
                const Gap(18),
                RichText(
                  text: TextSpan(
                    text: 'Esqueceu a Senha? ',
                    style: theme.textTheme.bodySmall,
                    children: [
                      TextSpan(
                        text: 'Recupere aqui!',
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.bold,
                        ),
                        // TODO: Reset Password redirect
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
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
