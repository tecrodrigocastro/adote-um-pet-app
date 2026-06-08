import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:signal_form/signal_form.dart';

import '../../../../../core/enums/pet_enums.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/routes.dart';
import '../viewmodels/donate_viewmodel.dart';

part 'widgets/choose_pet_type_row.dart';

class DonateInfoPage extends StatefulWidget {
  const DonateInfoPage({super.key});

  @override
  State<DonateInfoPage> createState() => _DonateInfoPageState();
}

class _DonateInfoPageState extends State<DonateInfoPage> {
  final viewModel = DonateViewmodel();

  @override
  void dispose() {
    viewModel.form.dispose();
    super.dispose();
  }

  Future<void> _showDiscardDialog(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Descartar alterações?'),
        content:
            const Text('Você tem dados preenchidos. Deseja sair sem salvar?'),
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
    final theme = Theme.of(context);
    final f = viewModel.form.fields;

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
        appBar: AppBar(),
        drawer: CustomDrawerDS(
          userName: 'Mariana Oliveira',
          userLocation: 'Sao Paulo - SP',
          userImage: AppImages.catChoose,
          onAdoptTap: () => router.go(AppRoutes.donateInfoPage),
          onAccountTap: () {},
          onDonateTap: () {},
          onPetinhaTap: () {},
          onMessagesTap: () {},
          onLogoutTap: () {},
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Bem vinda, ',
                  style: theme.textTheme.headlineSmall,
                  children: [
                    TextSpan(
                      text: 'Mariana!',
                      style: theme.textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              Text(
                'Ache um lar para o seu amigo peludo.',
                style: theme.textTheme.labelSmall,
              ),
              const Gap(24),

              // --- Nome ---
              Text('Qual o nome do seu pet?', style: theme.textTheme.titleSmall),
              const Gap(10),
              SignalTextField(
                field: f.name,
                textInputAction: TextInputAction.next,
                decoration: _inputDecoration('Ex: Rex, Mia...'),
              ),
              const Gap(20),

              // --- Tipo ---
              Text('Qual o tipo do pet?', style: theme.textTheme.titleSmall),
              const Gap(10),
              SignalChoiceChip<PetType>(
                field: f.type,
                spacing: 10,
                decoration: const InputDecoration(
                  errorStyle: TextStyle(fontSize: 12),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                options: PetType.values
                    .map((t) => SignalFieldOption(value: t, label: t.label))
                    .toList(),
              ),
              const Gap(20),

              // --- Sexo ---
              Text('Qual o sexo?', style: theme.textTheme.titleSmall),
              const Gap(10),
              SignalChoiceChip<PetGender>(
                field: f.gender,
                spacing: 10,
                decoration: const InputDecoration(
                  errorStyle: TextStyle(fontSize: 12),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                options: PetGender.values
                    .map((g) => SignalFieldOption(value: g, label: g.label))
                    .toList(),
              ),
              const Gap(20),

              // --- Porte ---
              Text('Qual o porte?', style: theme.textTheme.titleSmall),
              const Gap(10),
              SignalChoiceChip<PetSize>(
                field: f.size,
                spacing: 10,
                decoration: const InputDecoration(
                  errorStyle: TextStyle(fontSize: 12),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                options: PetSize.values
                    .map((s) => SignalFieldOption(value: s, label: s.label))
                    .toList(),
              ),
              const Gap(20),

              // --- Data de nascimento ---
              Text('Data de nascimento', style: theme.textTheme.titleSmall),
              const Gap(10),
              SignalDateTimePicker(
                field: f.birthDate,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                helpText: 'Selecione a data de nascimento',
                confirmText: 'Confirmar',
                cancelText: 'Cancelar',
                decoration: _inputDecoration(
                  'Selecione a data',
                  suffix: const Icon(Icons.calendar_today, size: 20),
                ),
              ),
              const Gap(4),

              // --- Switches: vacinado e castrado ---
              SignalSwitch(
                field: f.vaccinated,
                title: const Text('Vacinado'),
                subtitle: const Text('O pet está com as vacinas em dia'),
                activeColor: AppColors.secondaryColor,
              ),
              SignalSwitch(
                field: f.castrated,
                title: const Text('Castrado'),
                subtitle: const Text('O pet foi castrado'),
                activeColor: AppColors.secondaryColor,
              ),
              const Gap(12),

              // --- Descrição ---
              Text('Descreva o pet', style: theme.textTheme.titleSmall),
              const Gap(10),
              SignalTextField(
                field: f.description,
                maxLines: 4,
                textInputAction: TextInputAction.newline,
                decoration: _inputDecoration(
                  'Conte sobre a personalidade, hábitos e cuidados necessários...',
                ),
              ),
              const Gap(32),

              // --- Botão reativo ao form.valid ---
              ListenableBuilder(
                listenable: viewModel.form,
                builder: (context, _) {
                  if (viewModel.form.isSubmitting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return PrimaryButtonDs(
                    width: double.maxFinite,
                    title: 'Publicar pet para adoção',
                    onPressed: viewModel.onSubmit,
                  );
                },
              ),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint, {Widget? suffix}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: AppColors.inputGrayColor,
      suffixIcon: suffix,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
