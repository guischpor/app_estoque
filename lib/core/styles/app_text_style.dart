import 'app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  static TextStyle get fontRobotoblack18 => GoogleFonts.roboto(
        fontSize: 18,
        color: AppColors.black,
      );
  static TextStyle get fontNunitoblack8 => GoogleFonts.nunito(
        fontSize: 18,
        color: AppColors.black,
      );

  static TextStyle get robotoBlack18 =>
      fontRobotoblack18.copyWith(color: AppColors.black);
  static TextStyle get robotoWhite18 =>
      fontRobotoblack18.copyWith(color: AppColors.white);
  static TextStyle get robotoRed18 =>
      fontRobotoblack18.copyWith(color: AppColors.red);
  static TextStyle get robotoLightGrey18 =>
      fontRobotoblack18.copyWith(color: AppColors.lightGrey);
  static TextStyle get robotoGrey18 =>
      fontRobotoblack18.copyWith(color: AppColors.grey);
  static TextStyle get robotoPink18 =>
      fontRobotoblack18.copyWith(color: AppColors.pink);
  static TextStyle get robotoPurple18 =>
      fontRobotoblack18.copyWith(color: AppColors.purple);
  static TextStyle get robotoBlue18 =>
      fontRobotoblack18.copyWith(color: AppColors.blue);

  static TextStyle get nunitotBlack18 =>
      fontNunitoblack8.copyWith(color: AppColors.black);
  static TextStyle get nunitoWhite18 =>
      fontNunitoblack8.copyWith(color: AppColors.white);
  static TextStyle get nunitoRed18 =>
      fontNunitoblack8.copyWith(color: AppColors.red);
  static TextStyle get nunitoLightGrey18 =>
      fontNunitoblack8.copyWith(color: AppColors.lightGrey);
  static TextStyle get nunitoGrey18 =>
      fontNunitoblack8.copyWith(color: AppColors.grey);
  static TextStyle get nunitoPink18 =>
      fontNunitoblack8.copyWith(color: AppColors.pink);
  static TextStyle get nunitoPurple18 =>
      fontNunitoblack8.copyWith(color: AppColors.purple);
  static TextStyle get nunitoLightGreen18 =>
      fontNunitoblack8.copyWith(color: AppColors.lightGreen);
  static TextStyle get nunitoYellow18 =>
      fontNunitoblack8.copyWith(color: AppColors.yellow);
  static TextStyle get nunitoPurpleText18 =>
      fontNunitoblack8.copyWith(color: AppColors.purpleText);
  static TextStyle get nunitoBlueText18 =>
      fontNunitoblack8.copyWith(color: AppColors.blue);
  static TextStyle get nunitoRedFavoriteText18 =>
      fontNunitoblack8.copyWith(color: AppColors.redFavorite);
  static TextStyle get nunitoOrangeText18 =>
      fontNunitoblack8.copyWith(color: AppColors.orange);
}

extension TextStyleExt on TextStyle {
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);

  TextStyle get font10 => copyWith(fontSize: 10);
  TextStyle get font11 => copyWith(fontSize: 11);
  TextStyle get font12 => copyWith(fontSize: 12);
  TextStyle get font13 => copyWith(fontSize: 13);
  TextStyle get font14 => copyWith(fontSize: 14);
  TextStyle get font15 => copyWith(fontSize: 15);
  TextStyle get font16 => copyWith(fontSize: 16);
  TextStyle get font17 => copyWith(fontSize: 17);
  TextStyle get font18 => copyWith(fontSize: 18);
  TextStyle get font20 => copyWith(fontSize: 20);
  TextStyle get font22 => copyWith(fontSize: 22);
  TextStyle get font24 => copyWith(fontSize: 24);
  TextStyle get font25 => copyWith(fontSize: 25);
  TextStyle get font26 => copyWith(fontSize: 26);
  TextStyle get font27 => copyWith(fontSize: 27);
  TextStyle get font28 => copyWith(fontSize: 28);
  TextStyle get font29 => copyWith(fontSize: 29);
  TextStyle get font30 => copyWith(fontSize: 30);
  TextStyle get font35 => copyWith(fontSize: 35);
}
