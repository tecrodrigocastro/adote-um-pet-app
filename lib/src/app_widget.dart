import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/features/auth/presentation/bloc/auth_bloc.dart';
import 'app/features/home/presentation/bloc/home_bloc.dart';
import 'core/DI/dependency_injector.dart';
import 'routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injector<AuthBloc>()),
        BlocProvider(create: (context) => injector<HomeBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Adote um Pet',
        theme: AppTheme.theme,
        routerConfig: router,
      ),
    );
  }
}
