import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
    this.imageName, {
    Key? key,
    this.height,
    this.width,
    this.padding,
    this.color,
    this.fit,
  }) : super(key: key);

  final String imageName;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final Color? color;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Image.asset(
        imageName,
        color: color,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
