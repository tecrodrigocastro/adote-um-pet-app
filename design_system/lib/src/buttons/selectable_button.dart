import 'package:flutter/material.dart';

import '../../design_system.dart';

class SelectableButtonDs extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double height;
  final double width;
  final bool isSelected;
  final ImageProvider? image;

  const SelectableButtonDs({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryColor,
    this.foregroundColor = Colors.white,
    this.height = 38,
    this.width = 222,
    this.isSelected = false,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10),
        fixedSize: Size(width, height),
        backgroundColor: isSelected ? backgroundColor : const Color(0xFFEFEFF1),
        // foregroundColor: isSelected ? foregroundColor : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (image != null)
            Image(
              image: image!,
              fit: BoxFit.contain,
              color: isSelected ? Colors.white : const Color(0xFF767676),
            ),
          Text(
            title,
            style: theme.textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: isSelected ? foregroundColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
