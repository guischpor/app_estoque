import 'package:flutter/material.dart';
import 'package:app_estoque/presentation/presenter/widgets/transform_widget_button.dart';

class CustomMenuItemDrawer extends StatefulWidget {
  final void Function() onTap;
  final Color backgroundColor;
  final Color backgroundColorSelected;
  final EdgeInsets paddingItem;
  final Color? splashColor;
  final int indexItem;
  final int selectedItem;
  final IconData icon;
  final Color colorIcon;
  final Color colorSelected;
  final double sizeIcon;
  final double widthItem;
  final String label;
  final TextStyle textStyleItem;
  final TextStyle textStyleItemSelected;

  const CustomMenuItemDrawer({
    super.key,
    required this.onTap,
    required this.backgroundColor,
    required this.backgroundColorSelected,
    this.paddingItem = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    this.splashColor = Colors.transparent,
    required this.indexItem,
    required this.selectedItem,
    required this.icon,
    required this.colorIcon,
    required this.colorSelected,
    required this.sizeIcon,
    this.widthItem = 24,
    required this.label,
    required this.textStyleItem,
    required this.textStyleItemSelected,
  });

  @override
  State<CustomMenuItemDrawer> createState() => _CustomMenuItemDrawerState();
}

class _CustomMenuItemDrawerState extends State<CustomMenuItemDrawer> {
  bool isSelected() {
    bool validate = false;
    setState(() {
      validate = widget.indexItem == widget.selectedItem;
    });
    return validate;
  }

  @override
  Widget build(BuildContext context) {
    return TransformWidgetButton(
      onTap: widget.onTap,
      backgroundColor: isSelected()
          ? widget.backgroundColorSelected
          : widget.backgroundColor,
      splashColor: widget.splashColor,
      child: Container(
        padding: widget.paddingItem,
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: isSelected() ? widget.colorSelected : widget.colorIcon,
              size: widget.sizeIcon,
            ),
            SizedBox(width: widget.widthItem),
            Text(
              widget.label,
              style: isSelected()
                  ? widget.textStyleItemSelected
                  : widget.textStyleItem,
            ),
          ],
        ),
      ),
    );
  }
}
