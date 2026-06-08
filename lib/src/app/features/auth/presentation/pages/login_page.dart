import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:signal_form/signal_form.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/show_snack_bar.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final viewModel = GetIt.I.get<LoginViewmodel>();

  @override
  void initState() {
    super.initState();
    viewModel.loginCommand.addListener(_onLoginResult);
  }

  void _onLoginResult() {
    viewModel.loginCommand.result?.fold(
      (appResponse) {
        router.go(AppRoutes.homePage);
      },
      (exception) {
        viewModel.loginCommand.clearResult();

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
    viewModel.form.dispose();
    viewModel.loginCommand.removeListener(_onLoginResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
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
              _FieldShell.email(
                context: context,
                field: viewModel.form.fields.email,
              ),
              const Gap(20),
              _FieldShell.password(
                context: context,
                field: viewModel.form.fields.password,
                isPasswordVisible: viewModel.isPasswordVisible.value,
                onToggleVisibility: viewModel.togglePasswordVisibility,
              ),
              const Gap(25),
              ListenableBuilder(
                listenable: Listenable.merge([
                  viewModel.loginCommand,
                  viewModel.form,
                ]),
                builder: (context, child) {
                  if (viewModel.loginCommand.running) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return PrimaryButtonDs(
                    title: 'Login',
                    onPressed: viewModel.onSubmit,
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
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldShell extends StatelessWidget {
  final Widget child;

  const _FieldShell({required this.child});

  factory _FieldShell.email({
    required BuildContext context,
    required Field<String> field,
  }) {
    return _FieldShell(
      child: SignalTextField(
        field: field,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: _decoration(context, 'e-mail'),
      ),
    );
  }

  factory _FieldShell.password({
    required BuildContext context,
    required Field<String> field,
    required bool isPasswordVisible,
    required VoidCallback onToggleVisibility,
  }) {
    return _FieldShell(
      child: SignalTextField(
        field: field,
        obscureText: !isPasswordVisible,
        textInputAction: TextInputAction.done,
        decoration: _decoration(
          context,
          'senha',
          suffixIcon: IconButton(
            onPressed: onToggleVisibility,
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      ),
    );
  }

  static InputDecoration _decoration(
    BuildContext context,
    String hint, {
    Widget? suffixIcon,
  }) {
    final theme = Theme.of(context);
    return InputDecoration(
      hintText: hint,
      hintStyle: theme.textTheme.bodyLarge,
      filled: true,
      fillColor: AppColors.whiteColor,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 303,
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 3,
        child: child,
      ),
    );
  }
}
