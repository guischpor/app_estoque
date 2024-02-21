import 'avatar.dart';
import 'custom_image.dart';
import 'package:flutter/material.dart';
import '../../../core/styles/app_color.dart';
import '../../../core/styles/app_text_style.dart';
// ignore_for_file: unnecessary_question_mark



class ImageProfile extends StatefulWidget {
  const ImageProfile({
    super.key,
    required this.urlImage,
    required this.fileImage,
    required this.name,
    required this.onTap,
  });

  final String? urlImage;
  final dynamic? fileImage;
  final String name;
  final void Function()? onTap;

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _stackAvatar(
          onTap: widget.onTap,
        ),
        const SizedBox(height: 15),
        Text(
          widget.name,
          style: AppTextStyle.nunitoPurple18.font18.bold.copyWith(
            color: AppColors.purpleLight,
          ),
        ),
      ],
    );
  }

  Widget _avatar() {
    if (widget.fileImage != null) {
      return Avatar.file(
        file: widget.fileImage,
        maxRadius: 70,
      );
    } else if (widget.fileImage != null ||
        widget.urlImage == null ||
        widget.urlImage!.isEmpty) {
      return Avatar.assets(
        urlImage: 'assets/icons/icon_avatar.png',
        maxRadius: 70,
      );
    } else {
      return Avatar.network(
        urlImage: widget.urlImage ?? '',
        maxRadius: 70,
      );
    }
  }

  Widget _stackAvatar({
    required void Function()? onTap,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _avatar(),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onTap,
            child: const CircleAvatar(
              maxRadius: 31,
              backgroundColor: AppColors.scaffoldBackgroundColor,
              child: CircleAvatar(
                maxRadius: 26,
                backgroundColor: AppColors.pink,
                child: CustomImage(
                  'assets/icons/icon_camera.png',
                  width: 24,
                  // height: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
