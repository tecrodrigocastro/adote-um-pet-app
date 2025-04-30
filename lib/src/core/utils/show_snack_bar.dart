import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

void showMessageSnackBar(
  BuildContext context,
  String message, {
  Color? color = AppColors.primaryColor,
  Color? textColor = AppColors.whiteColor,
  required IconData icon,
  required Color iconColor,
}) {
  final theme = Theme.of(context);
  final snackbar = SnackBar(
    backgroundColor: color,
    content: Row(
      spacing: 8,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        Text(
          message,
          style: theme.textTheme.bodySmall!.copyWith(
            color: textColor,
          ),
        )
      ],
    ),
    behavior: SnackBarBehavior.floating,
  );

  final scaffoldMsg = ScaffoldMessenger.of(context);
  scaffoldMsg
    ..hideCurrentSnackBar()
    ..showSnackBar(snackbar);
}
