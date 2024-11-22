import 'package:flutter/material.dart';

import '../../design_system.dart';
import 'drawer_item.dart';

class CustomDrawerDS extends StatelessWidget {
  final String userName;
  final String userLocation;
  final ImageProvider userImage;
  final VoidCallback? onAccountTap;
  final VoidCallback? onAdoptTap;
  final VoidCallback? onDonateTap;
  final VoidCallback? onPetinhaTap;
  final VoidCallback? onMessagesTap;
  final VoidCallback? onLogoutTap;

  const CustomDrawerDS({
    super.key,
    required this.userName,
    required this.userLocation,
    required this.userImage,
    this.onAccountTap,
    this.onAdoptTap,
    this.onDonateTap,
    this.onPetinhaTap,
    this.onMessagesTap,
    this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const SizedBox(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundImage: AppImages.catChoose,
                  ),
                ),
                title: Text(
                  userName,
                  style: theme.textTheme.titleMedium,
                ),
                subtitle: Text(
                  userLocation,
                  style: theme.textTheme.labelLarge,
                ),
              ),
            ),
          ),
          DrawerItemDS(
            icon: AppIcons.myAccountDrawer,
            title: 'Minha conta',
            onTap: onAccountTap ?? () {},
          ),
          DrawerItemDS(
            icon: AppIcons.adoptDrawer,
            title: 'Adotar um pet',
            onTap: onAccountTap ?? () {},
          ),
          DrawerItemDS(
            icon: AppIcons.donateDrawer,
            title: 'Doe seu pet',
            onTap: onAccountTap ?? () {},
          ),
          DrawerItemDS(
            icon: AppIcons.petinhaDrawer,
            title: 'Petinha online',
            onTap: onAccountTap ?? () {},
          ),
          DrawerItemDS(
            icon: AppIcons.messagesDrawer,
            title: 'Mensagens',
            onTap: onAccountTap ?? () {},
          ),
          SizedBox(
            height: size.height * 0.3,
          ),
          DrawerItemDS(
            title: 'Sair',
            onTap: onAccountTap ?? () {},
            showLeading: false,
          ),
        ],
      ),
    );
  }
}
