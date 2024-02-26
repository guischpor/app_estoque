import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/styles/app_color.dart';
import '../../../../core/styles/app_text_style.dart';
// ignore_for_file: must_be_immutable

class CustomTextForm extends StatelessWidget {
  final String? labelText;
  final String? label;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool obscureText;
  final String? hintText;
  final Widget? preffix;
  final Widget? suffix;
  final bool? enabled;
  final bool isActiveTitle;
  final String? title;
  final void Function(String)? onChanged;
  final bool autofocus;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  TextStyle? hintStyle = AppTextStyle.robotoLightGrey18.font15;
  TextStyle? textStyleForm = AppTextStyle.robotoLightGrey18.font13;
  final bool readOnly;
  final void Function()? onTap;
  final Color backgroundColorInput;

  CustomTextForm({
    Key? key,
    this.label,
    this.labelText,
    this.textInputAction,
    required this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.obscureText = false,
    this.hintText,
    this.hintStyle,
    this.preffix,
    this.suffix,
    this.enabled,
    this.isActiveTitle = false,
    this.title,
    this.onChanged,
    this.autofocus = false,
    this.borderRadius = 32,
    this.contentPadding = const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
    this.readOnly = false,
    this.onTap,
    this.backgroundColorInput = Colors.transparent,
    this.textStyleForm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isActiveTitle) ...[
          Text(
            title!,
            style: AppTextStyle.nunitotBlack18.font14.bold.copyWith(
              color: AppColors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 5),
        ],
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            color: backgroundColorInput,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              hintStyle: hintStyle,
              prefixIcon: preffix,
              suffixIcon: suffix,
              contentPadding: contentPadding,
            ),
            initialValue: initialValue,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            controller: controller,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            maxLines: maxLines,
            onSaved: onSaved,
            validator: validator,
            obscureText: obscureText,
            enabled: enabled,
            onChanged: onChanged,
            style: textStyleForm ?? AppTextStyle.robotoGrey18.font15,
            autofocus: autofocus,
            readOnly: readOnly,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
