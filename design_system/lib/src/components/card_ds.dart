import 'package:flutter/material.dart';

class CardComponentDS extends StatelessWidget {
  final ImageProvider backGroundImage;
  const CardComponentDS({super.key, required this.backGroundImage});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      height: height * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(image: backGroundImage, fit: BoxFit.cover),
        color: Colors.red,
        borderRadius: BorderRadius.circular(33),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
