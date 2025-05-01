import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../design_system.dart';
import '../components/card_ds.dart';

class HomeSliderDS extends StatelessWidget {
  final bool isFavorite;
  final bool showNextButton;
  final bool showPreviousButton;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final VoidCallback onchatTap;
  final CachedNetworkImage backGroundImage;
  final bool isLoading;
  final String title;

  const HomeSliderDS({
    super.key,
    this.isFavorite = true,
    this.showNextButton = false,
    this.showPreviousButton = false,
    this.isLoading = true,
    required this.onNext,
    required this.onPrevious,
    required this.backGroundImage,
    required this.title,
    required this.onchatTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CardComponentDS(
          backGroundImage: backGroundImage,
        ),
        Positioned(
          bottom: 30,
          left: 27,
          child: PetInfoRow(
            title: title,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (showPreviousButton)
                  GestureDetector(
                    onTap: onPrevious,
                    child: Transform.rotate(
                      angle: 3.14,
                      child: const Icon(
                        size: 40,
                        color: Colors.white,
                        Icons.play_arrow_outlined,
                      ),
                    ),
                  ),
                if (!showPreviousButton) const SizedBox.shrink(),
                if (showNextButton)
                  GestureDetector(
                    onTap: onNext,
                    child: const Icon(
                      color: Colors.white,
                      size: 40,
                      Icons.play_arrow_outlined,
                    ),
                  ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              size: 50,
              color: isFavorite ? AppColors.primaryColor : Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: GestureDetector(
            onTap: onchatTap,
            child: const ChatButtonDs(),
          ),
        ),
      ],
    );
  }
}

class PetInfoRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String subtitle2;
  const PetInfoRow({
    super.key,
    this.title = 'Nome do Pet, 2 anos',
    this.subtitle = 'Border collie - São Paulo',
    this.subtitle2 = '2km de distância',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontSize: 22.54,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontSize: 13.83,
          ),
        ),
        Text(
          subtitle2,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontSize: 13.83,
          ),
        ),
      ],
    );
  }
}
