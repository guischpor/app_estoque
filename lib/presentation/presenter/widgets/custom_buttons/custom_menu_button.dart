import '../custom_image.dart';
import 'package:flutter/material.dart';
import '../transform_widget_button.dart';
import '../../../../core/styles/app_color.dart';
import '../../../../core/styles/app_text_style.dart';



class CustomMenuButtom extends StatelessWidget {
  const CustomMenuButtom({
    super.key,
    required this.image,
    required this.title,
    required this.size,
    this.onTap,
  });

  final String image;
  final double size;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TransformWidgetButton(
      backgroundColor: Colors.transparent,
      splashColor: AppColors.pinkLight.withOpacity(0.5),
      onTap: onTap!,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImage(
              image,
              height: size,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: AppTextStyle.nunitoPink18.font18.bold,
            )
          ],
        ),
      ),
    );
  }
}
