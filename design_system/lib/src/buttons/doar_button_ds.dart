import 'package:flutter/material.dart';

import '../../design_system.dart';

class DoarButtonDS extends StatelessWidget {
  const DoarButtonDS({super.key, required this.onTap});

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
                color: AppColors.doarButtonColor,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 24.0),
                    child: Text(
                      'Doar',
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
            left: 0,
            top: 4,
            child: Container(
              width: 324,
              height: 190,
              margin: const EdgeInsets.only(left: 20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AppImages.doarButtonBg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: -44,
            child: Container(
              width: 240,
              height: 240,
              margin: const EdgeInsets.only(left: 20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AppImages.dog,
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
