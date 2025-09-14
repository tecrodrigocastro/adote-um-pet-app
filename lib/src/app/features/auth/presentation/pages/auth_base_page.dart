import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/enums/user_type_enum.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/routes.dart';

class AuthBasePage extends StatelessWidget {
  const AuthBasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AppImages.logo),
            const Gap(50),
            PrimaryButtonDs(
              title: 'Login',
              onPressed: () {
                router.go(AppRoutes.loginPage);
              },
            ),
            const Gap(20),
            PrimaryButtonDs(
              title: 'Registrar',
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: AppColors.whiteColor,
                  context: context,
                  builder: (context) => Container(
                    padding: const EdgeInsets.all(20),
                    width: size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Escolha o tipo de conta',
                          style: theme.textTheme.titleMedium,
                        ),
                        const Gap(20),
                        PrimaryButtonDs(
                          title: 'Pessoa Física',
                          onPressed: () {
                            router.go(AppRoutes.registerPage, extra: UserType.individual);
                          },
                          backgroundColor: AppColors.primaryColor,
                        ),
                        const Gap(10),
                        PrimaryButtonDs(
                          title: 'Organização',
                          onPressed: () {
                            router.go(AppRoutes.registerPage, extra: UserType.organization);
                          },
                          backgroundColor: AppColors.secondaryColor,
                        ),
                        const Gap(10),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancelar'),
                        ),
                      ],
                    ),
                  ),
                );
              },
              backgroundColor: AppColors.secondaryColor,
            ),
            const Gap(20),
            Text(
              'Powered by Flutterando',
              style: theme.textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
