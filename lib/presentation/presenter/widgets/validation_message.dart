import 'package:flutter/material.dart';
import '../../../core/styles/app_color.dart';
import '../../../core/styles/app_text_style.dart';

class ValidationMessage extends StatelessWidget {
  const ValidationMessage({
    super.key,
    required this.message,
    required this.icon,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.lightGrey,
          size: 18,
        ),
        Text(
          message,
          style: AppTextStyle.robotoGrey18.font14.normal,
        ),
      ],
    );
  }
}
