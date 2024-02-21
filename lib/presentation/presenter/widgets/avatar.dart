import 'package:flutter/material.dart';
import '../../../core/enum/type_avatar_enum.dart';
import 'package:cached_network_image/cached_network_image.dart';
// ignore_for_file: must_be_immutable, unnecessary_question_mark




class Avatar extends StatelessWidget {
  final String? urlImage;
  final dynamic? file;
  double? maxRadius;
  TypeAvatar typeAvatar;

  Avatar._({
    required this.urlImage,
    required this.maxRadius,
    required this.file,
    required this.typeAvatar,
  });

  factory Avatar.file({
    required dynamic file,
    double? maxRadius = 70,
  }) {
    return Avatar._(
      file: file,
      maxRadius: maxRadius,
      urlImage: null,
      typeAvatar: TypeAvatar.file,
    );
  }

  factory Avatar.network({
    required String? urlImage,
    double? maxRadius = 70,
  }) {
    return Avatar._(
      file: null,
      maxRadius: maxRadius,
      urlImage: urlImage ?? '',
      typeAvatar: TypeAvatar.network,
    );
  }

  factory Avatar.assets({
    required String urlImage,
    double? maxRadius = 70,
  }) {
    return Avatar._(
      file: null,
      maxRadius: maxRadius,
      urlImage: urlImage,
      typeAvatar: TypeAvatar.assets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: maxRadius,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: switchTypeAvatar(typeAvatar),
      ),
    );
  }

  Widget switchTypeAvatar(TypeAvatar type) {
    switch (type) {
      case TypeAvatar.file:
        return Image.file(
          file,
          fit: BoxFit.cover,
          height: 160,
          width: 160,
        );
      case TypeAvatar.network:
        return CachedNetworkImage(
          imageUrl: urlImage!,
          fit: BoxFit.cover,
          height: 160,
          width: 160,
          errorWidget: (context, url, error) {
            return Image.asset(
              'assets/icons/icon_avatar.png',
              fit: BoxFit.cover,
              height: 160,
              width: 160,
            );
          },
        );
      case TypeAvatar.assets:
        return Image.asset(
          urlImage!,
          fit: BoxFit.cover,
          height: 160,
          width: 160,
        );
      default:
        return Image.asset(
          urlImage!,
          fit: BoxFit.cover,
          height: 160,
          width: 160,
        );
    }
  }
}
