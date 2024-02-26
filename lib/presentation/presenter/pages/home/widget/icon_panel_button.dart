import 'package:flutter/material.dart';
import '../../../../../core/styles/app_color.dart';

class IconPanelButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;

  const IconPanelButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: Card(
        elevation: 0,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: AppColors.white,
          size: 18,
        ),
      ),
    );
  }
}
