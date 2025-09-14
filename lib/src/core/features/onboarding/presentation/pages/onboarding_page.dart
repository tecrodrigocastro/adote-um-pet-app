import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../routes/routes.dart';
import '../widgets/item_page_view_onboarding.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            SizedBox(
              height: size.height * 0.7,
              child: PageView.builder(
                itemCount: 2,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return ItemPageViewOnboarding(
                    title: index == 0 ? 'Bem-vindo!' : 'Petinha Online',
                    description: index == 0
                        ? 'Olá, que bom que você veio! Aqui você encontra o seu  melhor amigo ou ajuda alguém  a encontrar seu bichinho.'
                        : 'Além de encontar seu bichinho você pode participar da nossa Petinha Online! Com uma contribuição você ajuda milhares de Pets.',
                    image: index == 0
                        ? AppImages.imageOnboarding1
                        : AppImages.imageOnboarding2,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: _currentPage == 0 ? 44 : 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0XFFC4C4C4),

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    //shape: BoxShape.circle,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: _currentPage == 1 ? 44 : 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0XFFC4C4C4),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    //shape: BoxShape.circle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (_currentPage == 1) {
                      router.go('/auth');
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    _currentPage == 0
                        ? 'Arraste para começar'
                        : 'Clique para começar',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: const Color(0XFFC4C4C4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
