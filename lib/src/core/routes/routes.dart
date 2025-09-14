import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../app/features/auth/presentation/pages/auth_base_page.dart';
import '../../app/features/auth/presentation/pages/login_page.dart';
import '../../app/features/auth/presentation/pages/register_page.dart';
import '../../app/features/auth/presentation/pages/welcome_page.dart';
import '../../app/features/donate/presentation/pages/donate_info_page.dart';
import '../../app/features/home/presentation/pages/filters_page.dart';
import '../../app/features/home/presentation/pages/home_page.dart';
import '../../app/features/message/presentation/pages/message/conversation_page.dart';
import '../../app/features/message/presentation/pages/messages_page.dart';
import '../features/choose/presentation/choose_page.dart';
import '../features/onboarding/presentation/pages/onboarding_page.dart';
import '../services/session_service.dart';
import 'app_routes.dart';

final router = GoRouter(
  initialLocation: AppRoutes.homePage,
  routes: [
    GoRoute(
      path: AppRoutes.onBoardPage,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.filtersPage,
      builder: (context, state) => const FiltersPage(),
    ),
    GoRoute(
      path: AppRoutes.homePage,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.allMessagePage,
      builder: (context, state) => const MessagePage(),
    ),
    GoRoute(
      path: AppRoutes.singleMessagePage,
      builder: (context, state) => const ConversationPage(),
    ),
    GoRoute(
      path: '/auth',
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
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.choosePage,
      builder: (context, state) => const ChoosePage(),
    ),
    GoRoute(
      path: AppRoutes.donateInfoPage,
      builder: (context, state) => const DonateInfoPage(),
    ),
  ],
  redirect: (context, state) async {
    bool isUserLoggedIn = await GetIt.I.get<SessionService>().isUserLoggedIn();
    if (!isUserLoggedIn) {
      return AppRoutes.loginPage;
    }
    return null;
  },
);
