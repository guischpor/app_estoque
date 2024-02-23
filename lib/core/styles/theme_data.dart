import 'app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:app_estoque/core/styles/app_color.dart';

class ThemeDataStyle {
  ThemeData get theme => ThemeData(
        primarySwatch: AppColors.materialBlue,
        canvasColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        useMaterial3: true,
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStateProperty.all(AppColors.white),
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: AppTextStyle.robotoGrey18.font15,
          labelStyle: AppTextStyle.robotoGrey18.font15,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blueLight,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.inputTextBorder,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.inputTextBorder,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.blueLight,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.grey;
            }
            if (states.contains(MaterialState.selected)) {
              return AppColors.blue;
            }
            return AppColors.white;
          }),
          checkColor: MaterialStateColor.resolveWith((states) {
            return AppColors.white;
          }),
          side: const BorderSide(
            color: AppColors.blue,
          ),
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
      );
}
