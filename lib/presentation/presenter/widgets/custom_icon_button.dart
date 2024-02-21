import 'package:flutter/material.dart';
import '../../../core/styles/app_color.dart';



class CustomIconButton extends StatelessWidget {
  final double? radius;
  final double? iconSize;
  final IconData iconData;
  final void Function()? onTap;
  final Color? iconColor;

  const CustomIconButton({
    Key? key,
    required this.iconData,
    required this.onTap,
    this.radius = 30,
    this.iconSize,
    this.iconColor = AppColors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius!),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Icon(
            iconData,
            size: iconSize,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
