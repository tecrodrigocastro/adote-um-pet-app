import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ItemPageViewOnboarding extends StatefulWidget {
  const ItemPageViewOnboarding(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  final String title;
  final String description;
  final AssetImage image;

  @override
  State<ItemPageViewOnboarding> createState() => _ItemPageViewOnboardingState();
}

class _ItemPageViewOnboardingState extends State<ItemPageViewOnboarding> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: widget.image),
        const SizedBox(
          width: 70,
        ),
        Text(
          widget.title,
          style: theme.textTheme.displaySmall!.copyWith(
            fontSize: 40,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            widget.description,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 14,
                  color: AppColors.blackColor,
                  fontStyle: FontStyle.normal,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
