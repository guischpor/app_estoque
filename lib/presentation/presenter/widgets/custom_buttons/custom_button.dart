import 'package:flutter/material.dart';
import '../../../../core/styles/app_text_style.dart';



// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius = 5,
    this.fontSize,
    this.overflow,
    this.softWrap,
    this.textAlign,
    this.fontWeight,
    this.padding,
  });

  final void Function()? onPressed;
  final String label;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final double? fontSize;
  final TextOverflow? overflow;
  final bool? softWrap;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          label,
          textAlign: textAlign,
          softWrap: softWrap,
          style: AppTextStyle.nunitoWhite18.font18.copyWith(
            fontSize: fontSize,
            overflow: overflow,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
