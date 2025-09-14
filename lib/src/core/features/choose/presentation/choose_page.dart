import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_routes.dart';
import '../../../routes/routes.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.98),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 56,
        children: [
          AdotarButtonDS(
            onTap: () {
              log('Adotar');
            },
          ),
          DoarButtonDS(
            onTap: () {
              router.go(AppRoutes.donateInfoPage);
            },
          ),
        ],
      ),
    );
  }
}
