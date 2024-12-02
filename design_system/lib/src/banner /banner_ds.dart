import 'package:flutter/material.dart';

class BannerDs extends StatelessWidget {
  final DecorationImage? backGroundImage;
  final double? borderRadius;
  final Widget? title;
  final Widget? subtitle;
  const BannerDs({
    super.key,
    this.backGroundImage,
    this.borderRadius,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 109,
      width: double.infinity,
      decoration: BoxDecoration(
        image: backGroundImage,
        borderRadius: BorderRadius.circular(borderRadius ?? 14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title ?? const SizedBox(),
          subtitle ?? const SizedBox(),
        ],
      ),
    );
  }
}
