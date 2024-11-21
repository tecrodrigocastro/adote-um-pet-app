import 'dart:developer';

import 'package:adote_um_pet/src/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:adote_um_pet/src/app/features/auth/presentation/controller/session_controller.dart';
import 'package:adote_um_pet/src/core/utils/show_snack_bar.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final authBloc = GetIt.I.get<AuthBloc>();
    final sessionController = GetIt.I.get<SessionController>();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
            size: 30,
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
                  controller: emailController,
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
                  controller: passwordController,
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
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
                const Gap(18),
                RichText(
                  text: const TextSpan(
                    text: 'Esqueceu a Senha?',
                    style: TextStyle(color: AppColors.blackColor),
                    children: [
                      TextSpan(
                        text: ' Recupere aqui!',
                        style: TextStyle(
                          color: AppColors.blueColor,
                          decoration: TextDecoration.underline,
                        ),
                      )
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
