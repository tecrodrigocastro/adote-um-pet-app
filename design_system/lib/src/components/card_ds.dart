import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardComponentDS extends StatelessWidget {
  final CachedNetworkImage backGroundImage;
  const CardComponentDS({super.key, required this.backGroundImage});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      height: height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: backGroundImage,
    );
  }
}
