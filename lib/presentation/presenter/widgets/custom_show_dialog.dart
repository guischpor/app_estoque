import 'package:flutter/material.dart';
import '../../../core/styles/app_color.dart';


Future<void> customModalShowDialog({
  required BuildContext context,
  required Widget? content,
  double paddingIn = 15,
  double paddintOut = 20,
  bool barrierDismissible = true,
}) {
  return showDialog(
    useSafeArea: true,
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) => Dialog(
      surfaceTintColor: AppColors.scaffoldBackgroundColor,
      insetPadding: EdgeInsets.all(paddintOut),
      child: Padding(
        padding: EdgeInsets.all(paddingIn),
        child: content,
      ),
    ),
  );
}
