import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AppImages.logo),
              const Gap(50),
              TextInputDs(
                label: 'e-mail',
                controller: emailController,
              ),
              const Gap(20),
              TextInputDs(
                label: 'senha',
                controller: passwordController,
                isPassword: true,
              ),
              const Gap(25),
              PrimaryButtonDs(title: 'Login', onPressed: () {}),
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
    );
  }
}
