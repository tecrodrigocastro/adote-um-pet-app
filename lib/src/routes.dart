import 'package:adote_um_pet/src/app/features/auth/presentation/pages/auth_base_page.dart';
import 'package:adote_um_pet/src/app/features/auth/presentation/pages/login_page.dart';
import 'package:adote_um_pet/src/app/features/auth/presentation/pages/register_page.dart';
import 'package:adote_um_pet/src/app/features/auth/presentation/pages/welcome_page.dart';
import 'package:adote_um_pet/src/core/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/auth',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: "/auth",
      builder: (context, state) => const AuthBasePage(),
      routes: [
        GoRoute(
          path: 'login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: 'register',
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: 'welcome',
          builder: (context, state) => const WelcomePage(),
        )
      ],
    ),
  ],
);
