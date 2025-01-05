import '../../../../../core/routes/app_routes.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/routes/routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.6,
                height: size.width * 0.4,
                child: const CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: AppColors.whiteColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(40),
              Text(
                'Olá Mariana,',
                style: theme.textTheme.displaySmall,
              ),
              Text(
                'Seja bem-vinda!',
                style: theme.textTheme.displaySmall,
              ),
              Gap(size.height * 0.3),
              PrimaryButtonDs(
                title: 'Começar',
                onPressed: () {
                  router.go(AppRoutes.choosePage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
