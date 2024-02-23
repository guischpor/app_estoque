import 'custom_image.dart';
import 'transform_widget_button.dart';
import 'package:flutter/material.dart';
import '../../../core/styles/app_color.dart';

AppBar customAppBar({
  bool isLeading = true,
  Widget? widget,
  bool? centerTitle = true,
  List<Widget>? actions,
  Color? backgroundColor = AppColors.colorAppBarBlue,
  Color? splashColor = AppColors.blue,
  Color? leadingBackgroundColor = AppColors.blueLight,
  Color? shadowColor,
  double? toolbarHeight = 70,
  double? elevation,
  PreferredSizeWidget? bottom,
  required BuildContext context,
  void Function()? onTap,
}) {
  return AppBar(
    title: widget ??
        const CustomImage(
          'assets/images/logo.png',
          height: 45,
        ),
    leading: isLeading
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
            child: TransformWidgetButton(
              backgroundColor: leadingBackgroundColor,
              splashColor: splashColor,
              onTap: onTap!,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          )
        : null,
    leadingWidth: 60,
    centerTitle: centerTitle,
    backgroundColor: backgroundColor,
    shadowColor: shadowColor,
    elevation: elevation,
    toolbarHeight: toolbarHeight,
    actions: actions,
    bottom: bottom,
  );
}
