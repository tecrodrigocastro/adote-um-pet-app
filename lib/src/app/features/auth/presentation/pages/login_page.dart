import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

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
                text: TextSpan(
                  text: 'Esqueceu a Senha?',
                  style: theme.textTheme.bodySmall,
                  children: [
                    TextSpan(
                      text: ' Recupere aqui!',
                      style: theme.textTheme.bodySmall!
                          .copyWith(
                        color: AppColors.blueColor,
                        decoration: TextDecoration.underline
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
