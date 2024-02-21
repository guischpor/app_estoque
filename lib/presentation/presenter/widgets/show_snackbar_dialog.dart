import 'package:flutter/material.dart';
import '../../../core/styles/app_text_style.dart';


SnackBar showSnackBarDialog({
  required String label,
  required String title,
  required IconData icon,
  Color? textColorLabel,
  Color? backgroundColor,
  SnackBarAction? action,
}) {
  return SnackBar(
    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 2),
    action: action,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.robotoWhite18.font14.normal,
            ),
            Text(
              label,
              style: AppTextStyle.robotoWhite18.font14.bold,
            ),
          ],
        ),
      ],
    ),
  );
}
