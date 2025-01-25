import 'package:flutter/material.dart';

import '../../design_system.dart';

class AdotarButtonDS extends StatelessWidget {
  const AdotarButtonDS({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          const Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 382,
              height: 200,
              child: Card(
                color: AppColors.adotarButtonColor,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Adotar',
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 4,
            child: Container(
              width: 324,
              height: 190,
              margin: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AppImages.adotarButtonBg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: -44,
            child: Container(
              width: 240,
              height: 240,
              margin: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AppImages.cat,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
