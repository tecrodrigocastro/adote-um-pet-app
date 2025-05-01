import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/show_snack_bar.dart';
import '../../domain/dtos/get_pets_params.dart';
import '../viewmodels/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.petType = 'dog'});

  final String petType;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeViewModel = GetIt.I.get<HomeViewmodel>();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    homeViewModel.logoutCommand.addListener(listener);
    homeViewModel.getPetCommand.execute(GetPetsParams());
  }

  listener() {
    homeViewModel.logoutCommand.result?.fold(
      (unit) {
        router.go(AppRoutes.loginPage);
      },
      (exception) {
        showMessageSnackBar(
          context,
          exception.message,
          icon: Icons.error,
          iconColor: AppColors.whiteColor,
          color: AppColors.primaryColor,
        );
      },
    );
  }

  @override
  void dispose() {
    homeViewModel.logoutCommand.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Image image = const Image(image: AppImages.logo);
    return ListenableBuilder(
      listenable: homeViewModel,
      builder: (context, _) {
        return Scaffold(
          drawer: CustomDrawerDS(
            userName: homeViewModel.loggeduser.name,
            userLocation: homeViewModel.loggeduser.address,
            userImage: image.image,
            onLogoutTap: () => homeViewModel.logoutCommand.execute(),
          ),
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 23,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      homeViewModel.loggeduser.name,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      homeViewModel.loggeduser.address,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Badge.count(
                  backgroundColor: AppColors.primaryColor,
                  count: 5,
                  child: const CircleAvatar(
                    child: FlutterLogo(),
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 18,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BannerDs(
                  backGroundImage: const DecorationImage(
                    image: AppImages.homeBannerDog,
                    fit: BoxFit.cover,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 22, left: 18),
                    child: Text(
                      'Tudo para \no seu pet!',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 22.4,
                      ),
                    ),
                  ),
                  subtitle: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 0),
                      child: Text(
                        'Clique aqui',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 11.5,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ),
                ),
                TextInputDs(
                  label: 'Procure o seu bixinho',
                  labelStyle: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: 13,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.secondaryColor,
                  ),
                ),
                homeViewModel.getPetCommand.running
                    ? const CardShimmer()
                    : HomeSliderDS(
                        onchatTap: () => router.push(AppRoutes.allMessagePage),
                        title: homeViewModel.currentPet.name +
                            homeViewModel.currentPet.birthDate,
                        isLoading: homeViewModel.getPetCommand.running,
                        backGroundImage: AppImages.networkImage(
                          imageUrl: 'https://picsum.photos/640/480',
                        ),
                        onPrevious: homeViewModel.onTapPrevious,
                        onNext: homeViewModel.onTapNext,
                        showNextButton: homeViewModel.showNextButton,
                        showPreviousButton: homeViewModel.showPreviousButton,
                        isFavorite: true,
                      ),
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
          ),
        );
      },
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildNavItem(AppIcons.dogIcon, "Dogs", 0),
          buildNavItem(AppIcons.catIcon, "Cats", 1),
          buildNavItem(AppIcons.rabbitIcon, "Rabbits", 2),
          buildNavItem(AppIcons.birdIcon, "Birds", 3),
        ],
      ),
    );
  }

  Widget buildNavItem(ImageProvider icon, String label, int index) {
    final isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.cyan : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Image(
              image: icon,
              width: 24,
              color: isSelected ? Colors.white : Colors.black54,
            ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
