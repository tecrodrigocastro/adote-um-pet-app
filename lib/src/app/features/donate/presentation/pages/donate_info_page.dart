import 'package:adote_um_pet/src/routes.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DonateInfoPage extends StatefulWidget {
  const DonateInfoPage({super.key});

  @override
  State<DonateInfoPage> createState() => _DonateInfoPageState();
}

class _DonateInfoPageState extends State<DonateInfoPage> {
  TextEditingController nomePetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),

      /// TODO : Componentizar o Drawer
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: const SizedBox(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(
                      backgroundImage: AppImages.catChoose,
                    ),
                  ),
                  title: Text('Mariana Oliveira', style: theme.textTheme.titleMedium),
                  subtitle: Text(
                    'São Paulo - SP',
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Image(image: AppIcons.myAccountDrawer, height: 24),
              title: Text('Minha conta', style: theme.textTheme.titleMedium),
              onTap: () {},
            ),
            ListTile(
              leading: const Image(image: AppIcons.adoptDrawer, height: 24),
              title: Text('Adotar um pet', style: theme.textTheme.titleMedium),
              onTap: () {
                router.go('/donate-info');
              },
            ),
            ListTile(
              leading: const Image(image: AppIcons.donateDrawer, height: 24),
              title: Text('Doe seu pet', style: theme.textTheme.titleMedium),
              onTap: () {},
            ),
            ListTile(
              leading: const Image(image: AppIcons.petinhaDrawer, height: 24),
              title: Text('Petinha online', style: theme.textTheme.titleMedium),
              onTap: () {},
            ),
            ListTile(
              leading: const Image(image: AppIcons.messagesDrawer, height: 24),
              title: Text('Mensagens', style: theme.textTheme.titleMedium),
              onTap: () {},
            ),
            Gap(size.height * 0.3),
            ListTile(
              title: Text('Sair', style: theme.textTheme.titleMedium),
              onTap: () {},
            ),
          ],
        ),
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
                  TextSpan(text: 'Mariana!', style: theme.textTheme.headlineMedium),
                ],
              ),
            ),
            Text('Ache um lar para o seu amigo peludo.', style: theme.textTheme.labelSmall),
            const Gap(20),
            Text('Qual o nome do seu pet?', style: theme.textTheme.titleSmall),
            const Gap(10),
            TextInputGrayDs(
              controller: nomePetController,
            ),
          ],
        ),
      ),
    );
  }
}
