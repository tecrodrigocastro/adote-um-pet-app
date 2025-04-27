import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/routes.dart';

part 'widgets/choose_pet_type_row.dart';

class DonateInfoPage extends StatefulWidget {
  const DonateInfoPage({super.key});

  @override
  State<DonateInfoPage> createState() => _DonateInfoPageState();
}

class _DonateInfoPageState extends State<DonateInfoPage> {
  TextEditingController nomePetController = TextEditingController();
  bool isButtonSelected = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
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
      body: Padding(
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
            const Gap(20),
            Text(
              'Qual o nome do seu pet?',
              style: theme.textTheme.titleSmall,
            ),
            const Gap(10),
            TextInputGrayDs(
              controller: nomePetController,
            ),
            const Gap(12),
            _ChoosePetTypeRow(),
          ],
        ),
      ),
    );
  }
}
