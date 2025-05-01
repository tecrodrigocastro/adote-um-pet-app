import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  //
  const ProfilePhoto({
    super.key,
    this.isOnline = false,
    required this.image,
  });

  final bool isOnline;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.blackColor,
                image: DecorationImage(
                  image: NetworkImage(image),
                ),
              ),
            ),
            if (isOnline)
              Positioned(
                top: 42,
                left: 47,
                child: Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
