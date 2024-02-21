import 'custom_image.dart';
import 'package:flutter/material.dart';
import '../../../core/styles/app_color.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

class CustomPrefixIcon extends StatelessWidget {
  const CustomPrefixIcon({
    super.key,
    required this.imagePath,
    this.padding = const EdgeInsets.all(12),
    this.width = 1,
    this.height,
    this.iconColor = AppColors.lightGrey,
  });

  final String imagePath;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: CustomImage(
        imagePath,
        width: width,
        height: height,
        color: iconColor,
      ),
    );
  }
}
