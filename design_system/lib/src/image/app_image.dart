import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../design_system.dart';

class AppImages {
  static const String packageName = 'design_system';
  static const logo = AssetImage(
    'assets/images/logo.png',
    package: packageName,
  );
  static const dogChoose = AssetImage(
    'assets/images/dog-choose.png',
    package: packageName,
  );
  static const catChoose = AssetImage(
    'assets/images/cat-choose.png',
    package: packageName,
  );
  static const dogChooseButton = AssetImage(
    'assets/images/dog-button.png',
    package: packageName,
  );
  static const catChooseButton = AssetImage(
    'assets/images/cat-button.png',
    package: packageName,
  );
  static const birdChooseButton = AssetImage(
    'assets/images/bird-button.png',
    package: packageName,
  );
  static const coelhoChooseButton = AssetImage(
    'assets/images/coelho-button.png',
    package: packageName,
  );
  static const cat = AssetImage(
    'assets/images/cat.png',
    package: packageName,
  );
  static const dog = AssetImage(
    'assets/images/dog.png',
    package: packageName,
  );
  static const adotarButtonBg = AssetImage(
    'assets/images/adotar-button-bg.png',
    package: packageName,
  );
  static const doarButtonBg = AssetImage(
    'assets/images/doar-button-bg.png',
    package: packageName,
  );

  static const imageOnboarding1 = AssetImage(
    'assets/images/onboarding-1.png',
    package: packageName,
  );

  static const imageOnboarding2 = AssetImage(
    'assets/images/onboarding-bird.png',
    package: packageName,
  );

  static const homeBannerDog = AssetImage(
    'assets/images/home-banner-dog.jpg',
    package: packageName,
  );

  static CachedNetworkImage networkImage(
      {required String imageUrl,
      Widget placeholder = const CircularProgressIndicator()}) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const CardShimmer(),
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  static const chatIcon = AssetImage(
    'assets/icons/chat.png',
    package: packageName,
  );
}
