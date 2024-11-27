import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../routes.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.98),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AdotarButtonDS(
            onTap: () {
              log('Adotar');
            },
          ),
          const Gap(56),
          DoarButtonDS(
            onTap: () {
              router.go('/donate-info');
            },
          ),
        ],
      ),
    );
  }
}
