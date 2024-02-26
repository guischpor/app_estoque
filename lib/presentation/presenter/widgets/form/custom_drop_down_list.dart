import 'package:flutter/material.dart';
import '../../../../core/styles/app_color.dart';
import '../../../../core/styles/app_text_style.dart';

class CustomDropDownList extends StatelessWidget {
  final bool? isIcon;
  final bool? isActiveTitle;
  final IconData? icon;
  final String? title;
  final String hint;
  final List<DropdownMenuItem<dynamic>>? itemsList;
  final void Function(dynamic)? onChanged;
  final dynamic value;
  final String? Function(dynamic)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final Key? dropDownkey;

  const CustomDropDownList({
    Key? key,
    this.title,
    required this.hint,
    this.isIcon = false,
    this.isActiveTitle = false,
    this.icon,
    this.itemsList,
    this.onChanged,
    this.value,
    this.validator,
    this.contentPadding = const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
    this.dropDownkey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (isIcon!) ...[
              Icon(
                icon,
                color: AppColors.black,
              ),
              const SizedBox(width: 5),
            ],
            if (isActiveTitle!) ...[
              Text(
                title!,
                style: AppTextStyle.nunitotBlack18.font14.bold.copyWith(
                  color: AppColors.black.withOpacity(0.5),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField(
          key: dropDownkey,
          decoration: InputDecoration(
            contentPadding: contentPadding,
          ),
          hint: Text(
            hint,
            style: AppTextStyle.robotoGrey18.font15,
          ),
          validator: validator,
          isExpanded: true,
          isDense: true,
          value: value,
          items: itemsList,
          onChanged: onChanged,
          style: AppTextStyle.robotoGrey18.font15,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ],
    );
  }
}
