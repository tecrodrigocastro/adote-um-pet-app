import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:signal_form/signal_form.dart';

import '../../../../../core/enums/user_type_enum.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/show_snack_bar.dart';
import '../viewmodels/register_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.typeUser});

  final UserType typeUser;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final viewModel = GetIt.I.get<RegisterViewmodel>();

  bool get _isOrg => widget.typeUser == UserType.organization;

  @override
  void initState() {
    super.initState();
    viewModel.form.fields.userType.value = widget.typeUser;
    viewModel.signUpCommand.addListener(_onSignUpResult);
  }

  void _onSignUpResult() {
    viewModel.signUpCommand.result?.fold(
      (appResponse) {
        viewModel.signUpCommand.clearResult();
        viewModel.form.reset();
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
        viewModel.signUpCommand.clearResult();
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
    viewModel.signUpCommand.removeListener(_onSignUpResult);
    super.dispose();
  }

  Future<void> _showDiscardDialog(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Descartar alterações?'),
        content: const Text(
            'Você tem dados preenchidos. Deseja sair sem salvar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Continuar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Sair'),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final org = viewModel.form.fields.organization;
    final addr = viewModel.form.fields.address;

    return ListenableBuilder(
      listenable: viewModel.form,
      builder: (context, child) => PopScope(
        canPop: !viewModel.form.isDirty,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) _showDiscardDialog(context);
        },
        child: child!,
      ),
      child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(17),
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _isOrg ? 'Cadastro Organização' : 'Cadastro Pessoa Física',
                style: theme.textTheme.displaySmall,
              ),
              const Gap(29),

              // --- Dados da conta ---
              _FormField(
                child: SignalTextField(
                  field: viewModel.form.fields.name,
                  textInputAction: TextInputAction.next,
                  decoration: _FormField.decoration(context, 'nome'),
                ),
              ),
              const Gap(25),

              // --- Campos exclusivos de organização ---
              if (_isOrg) ...[
                _FormField(
                  child: SignalTextField(
                    field: org.organizationName,
                    textInputAction: TextInputAction.next,
                    decoration:
                        _FormField.decoration(context, 'nome da organização'),
                  ),
                ),
                const Gap(25),
                _FormField(
                  child: SignalTextField(
                    field: org.cnpj,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: _FormField.decoration(context, 'CNPJ'),
                  ),
                ),
                const Gap(25),
                _FormField(
                  child: SignalTextField(
                    field: org.responsibleName,
                    textInputAction: TextInputAction.next,
                    decoration:
                        _FormField.decoration(context, 'nome do responsável'),
                  ),
                ),
                const Gap(25),
              ],

              _FormField(
                child: SignalTextField(
                  field: viewModel.form.fields.email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: _FormField.decoration(context, 'e-mail'),
                ),
              ),
              const Gap(25),

              ValueListenableBuilder<bool>(
                valueListenable: viewModel.isPasswordVisible,
                builder: (context, isVisible, _) => _FormField(
                  child: SignalTextField(
                    field: viewModel.form.fields.password,
                    obscureText: !isVisible,
                    textInputAction: TextInputAction.next,
                    decoration: _FormField.decoration(
                      context,
                      'senha',
                      suffixIcon: IconButton(
                        onPressed: viewModel.togglePasswordVisibility,
                        icon: Icon(isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(10),
              _PasswordChecklist(field: viewModel.form.fields.password),
              const Gap(15),

              ValueListenableBuilder<bool>(
                valueListenable: viewModel.isConfirmPasswordVisible,
                builder: (context, isVisible, _) => _FormField(
                  child: SignalTextField(
                    field: viewModel.form.fields.confirmPassword,
                    obscureText: !isVisible,
                    textInputAction: TextInputAction.next,
                    decoration: _FormField.decoration(
                      context,
                      'confirmar senha',
                      suffixIcon: IconButton(
                        onPressed: () => viewModel.isConfirmPasswordVisible
                            .value = !isVisible,
                        icon: Icon(isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(25),

              _FormField(
                child: SignalTextField(
                  field: viewModel.form.fields.phone,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  decoration: _FormField.decoration(context, 'telefone'),
                ),
              ),

              // --- Campos opcionais de organização ---
              if (_isOrg) ...[
                const Gap(25),
                _FormField(
                  child: SignalTextField(
                    field: org.missionStatement,
                    textInputAction: TextInputAction.next,
                    decoration:
                        _FormField.decoration(context, 'declaração de missão'),
                  ),
                ),
                const Gap(25),
                _FormField(
                  child: SignalTextField(
                    field: org.website,
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.next,
                    decoration:
                        _FormField.decoration(context, 'website (opcional)'),
                  ),
                ),
                const Gap(25),
                Text(
                  'Redes Sociais (opcional)',
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const Gap(15),
                _FormField(
                  child: SignalTextField(
                    field: org.facebook,
                    textInputAction: TextInputAction.next,
                    decoration: _FormField.decoration(context, 'Facebook'),
                  ),
                ),
                const Gap(15),
                _FormField(
                  child: SignalTextField(
                    field: org.instagram,
                    textInputAction: TextInputAction.next,
                    decoration: _FormField.decoration(context, 'Instagram'),
                  ),
                ),
                const Gap(15),
                _FormField(
                  child: SignalTextField(
                    field: org.twitter,
                    textInputAction: TextInputAction.next,
                    decoration: _FormField.decoration(context, 'Twitter'),
                  ),
                ),
              ],

              // --- Endereço ---
              const Gap(25),
              Text(
                'Endereço',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              const Gap(15),
              _FormField(
                child: SignalTextField(
                  field: addr.zipCode,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: _FormField.decoration(context, 'CEP'),
                ),
              ),
              const Gap(15),
              _FormField(
                child: SignalTextField(
                  field: addr.street,
                  textInputAction: TextInputAction.next,
                  decoration: _FormField.decoration(context, 'Rua'),
                ),
              ),
              const Gap(15),
              _FormField(
                child: SignalTextField(
                  field: addr.neighborhood,
                  textInputAction: TextInputAction.next,
                  decoration: _FormField.decoration(context, 'Bairro'),
                ),
              ),
              const Gap(15),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.3,
                    child: _FormField(
                      child: SignalTextField(
                        field: addr.numberHouse,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: _FormField.decoration(context, 'Número'),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Flexible(
                    child: _FormField(
                      child: SignalTextField(
                        field: addr.complement,
                        textInputAction: TextInputAction.next,
                        decoration: _FormField.decoration(
                            context, 'Complemento (opcional)'),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(15),
              Row(
                children: [
                  Expanded(
                    child: _FormField(
                      child: SignalTextField(
                        field: addr.city,
                        textInputAction: TextInputAction.next,
                        decoration: _FormField.decoration(context, 'Cidade'),
                      ),
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: size.width * 0.25,
                    child: _FormField(
                      child: SignalTextField(
                        field: addr.state,
                        textInputAction: TextInputAction.done,
                        decoration: _FormField.decoration(context, 'Estado'),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(40),

              Align(
                alignment: Alignment.center,
                child: ListenableBuilder(
                  listenable: Listenable.merge([
                    viewModel.signUpCommand,
                    viewModel.form,
                  ]),
                  builder: (context, _) {
                    if (viewModel.signUpCommand.running ||
                        viewModel.form.isSubmitting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return PrimaryButtonDs(
                      title: 'Cadastrar',
                      onPressed: viewModel.onSubmit,
                    );
                  },
                ),
              ),
              const Gap(24),
            ],
          ),
        ),
      ),
    ),
  );
  }
}

class _PasswordChecklist extends StatelessWidget {
  final Field<String> field;

  const _PasswordChecklist({required this.field});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: field,
      builder: (context, _) {
        final rules = field.exposedRules;
        if (rules.isEmpty) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: rules.map((rule) {
              return Row(
                spacing: 8,
                children: [
                  Icon(
                    rule.isValid ? Icons.check_circle : Icons.radio_button_unchecked,
                    size: 16,
                    color: rule.isValid ? AppColors.green : AppColors.grayHint,
                  ),
                  Text(
                    rule.message,
                    style: TextStyle(
                      fontSize: 12,
                      color: rule.isValid ? AppColors.green : AppColors.grayHint,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class _FormField extends StatelessWidget {
  final Widget child;

  const _FormField({required this.child});

  static InputDecoration decoration(
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
    return Material(
      borderRadius: BorderRadius.circular(5),
      elevation: 3,
      child: child,
    );
  }
}
