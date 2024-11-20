import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
              const Text(
                'Olá Mariana,',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Seja bem-vinda!,',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(size.height * 0.3),
              PrimaryButtonDs(title: 'Começar', onPressed: () {}),

              /*
              const Text(
                'Selecionar Foto',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.blackColor,
                ),
              ),
              */
            ],
          ),
        ),
      ),
    );
  }
}
