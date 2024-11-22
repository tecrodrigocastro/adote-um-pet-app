import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../routes.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: size.height * 0.5,
              width: size.width,
              alignment: AlignmentDirectional.bottomStart,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AppImages.dogChoose,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Text(
                'adotar',
                style: theme.textTheme.displayLarge,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              router.go('/donate-info');
            },
            child: Container(
              height: size.height * 0.5,
              width: size.width,
              alignment: AlignmentDirectional.bottomStart,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AppImages.catChoose,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Text(
                'doar',
                style: theme.textTheme.displayLarge,
              ),
            ),
          )
        ],
      ),
    );
  }
}
