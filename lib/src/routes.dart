import 'package:adote_um_pet/src/app/features/auth/presentation/pages/login_page.dart';
import 'package:adote_um_pet/src/core/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
