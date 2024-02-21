import 'package:flutter/material.dart';
import '../../../core/styles/app_color.dart';


class TransformWidgetButton extends StatefulWidget {
  const TransformWidgetButton({
    super.key,
    required this.child,
    required this.onTap,
    this.backgroundColor = AppColors.lightGrey,
    this.splashColor = AppColors.pink,
    this.borderRadius = 8,
  });

  final Widget child;
  final void Function() onTap;
  final Color? backgroundColor;
  final Color? splashColor; //efeito de cor quando pressionado o botao
  final double? borderRadius;

  @override
  State<TransformWidgetButton> createState() => _TransformWidgetButtonState();
}

class _TransformWidgetButtonState extends State<TransformWidgetButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: widget.backgroundColor!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius!),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(widget.borderRadius!),
        splashColor: widget.splashColor!,
        splashFactory: InkSplash.splashFactory,
        onTap: widget.onTap,
        child: widget.child,
      ),
    );
  }
}
