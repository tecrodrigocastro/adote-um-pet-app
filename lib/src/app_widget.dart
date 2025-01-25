import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Adote um Pet',
      theme: AppTheme.theme,
      routerConfig: router,
    );
  }
}
