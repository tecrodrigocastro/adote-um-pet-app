import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/show_snack_bar.dart';
import '../bloc/auth_bloc.dart';
import '../controller/session_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final authBloc = GetIt.I.get<AuthBloc>();
    final sessionController = GetIt.I.get<SessionController>();

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
                  controller: _emailController,
                  validator: (p0) {
                    if (p0.isEmpty) {
                      return 'Campo Obrigatório';
                    }
                    if (!p0.contains('@')) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                ),
                const Gap(20),
                TextInputDs(
                  label: 'senha',
                  controller: _passwordController,
                  isPassword: true,
                  validator: (p0) => p0.isEmpty ? 'Campo Obrigatório' : null,
                ),
                const Gap(25),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is LoginAuthSuccess) {
                      log('Token: ${state.data.data!.accessToken}');
                      sessionController.saveToken(state.data.data!.accessToken);
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
                            LoginAuthEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
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
