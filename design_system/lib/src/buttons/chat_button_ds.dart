import 'package:flutter/material.dart';

import '../image/image.dart';

class ChatButtonDs extends StatelessWidget {
  final Color backgroundColor;
  const ChatButtonDs({super.key, this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: const Image(
        image: AppImages.chatIcon,
      ),
    );
  }
}
