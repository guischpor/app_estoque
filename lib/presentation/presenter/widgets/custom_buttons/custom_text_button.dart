import 'package:flutter/material.dart';
import '../../../../core/styles/app_text_style.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  CustomTextButton._({
    Key? key,
    required this.title,
    required this.onTap,
    required this.textStyle,
    required this.buttonStyle,
  }) : super(key: key);

  final String title;
  final void Function() onTap;
  TextStyle textStyle = AppTextStyle.robotoBlack18.font15.w700;
  final ButtonStyle? buttonStyle;

  factory CustomTextButton.blue({
    required String title,
    required void Function() onTap,
    TextStyle? textStyle,
  }) {
    return CustomTextButton._(
      title: title,
      onTap: onTap,
      textStyle: textStyle ?? AppTextStyle.nunitoBlueText18.font15.w700,
      buttonStyle: TextButton.styleFrom(
        foregroundColor: const Color.fromRGBO(30, 188, 211, 1),
      ),
    );
  }

  factory CustomTextButton.black({
    required String title,
    required void Function() onTap,
    TextStyle? textStyle,
  }) {
    return CustomTextButton._(
      title: title,
      onTap: onTap,
      textStyle: textStyle ?? AppTextStyle.nunitoBlueText18.font15.w700,
      buttonStyle: TextButton.styleFrom(
        foregroundColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: buttonStyle,
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
