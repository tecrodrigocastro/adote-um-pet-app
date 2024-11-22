import 'package:flutter/material.dart';

class DrawerItemDS extends StatelessWidget {
  final ImageProvider? icon;
  final String title;
  final VoidCallback onTap;
  final bool showLeading;

  const DrawerItemDS({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    this.showLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: showLeading ? Image(image: icon!, height: 24) : null,
      title: Text(title, style: theme.textTheme.titleMedium),
      onTap: onTap,
    );
  }
}
