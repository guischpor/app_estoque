import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color red = Color.fromRGBO(255, 0, 0, 1);
  static const Color redFavorite = Color.fromRGBO(237, 77, 77, 1);
  static const Color green = Color.fromRGBO(6, 128, 12, 1);
  static const Color lightGreen = Color.fromRGBO(101, 204, 164, 1);
  static const Color lightGrey = Color.fromRGBO(189, 189, 189, 1);
  static const Color pink = Color.fromRGBO(236, 104, 147, 1);
  static const Color pinkLight = Color.fromRGBO(227, 164, 188, 1);
  static const Color purpleLight = Color.fromRGBO(160, 150, 196, 1);
  static const Color purple = Color.fromRGBO(90, 79, 151, 1);
  static const Color purpleText = Color.fromRGBO(134, 121, 208, 1);
  static const Color purplePopButton = Color.fromRGBO(126, 112, 205, 1);
  static const Color grey = Color.fromRGBO(137, 136, 134, 1);
  static const Color yellow = Color.fromRGBO(202, 171, 106, 1);
  static const Color blue = Color.fromRGBO(126, 173, 237, 1);
  static const Color blueLight = Color.fromRGBO(130, 159, 199, 1);
  static const Color orange = Color.fromRGBO(219, 158, 16, 1);

  //Colors Components
  static const Color colorAppBarBlue = Color.fromRGBO(126, 173, 237, 1);
  static const Color scaffoldBackgroundColor = Color.fromRGBO(249, 249, 249, 1);
  static const Color inputTextBorder = Color.fromRGBO(141, 137, 133, 1);
  static const Color inputFocusedBorder = Color.fromRGBO(90, 79, 151, 1);
  static const Color iconColorPrefix = Color.fromRGBO(145, 145, 145, 1);

  //Colors Card Home
  static const Color cardHomePurple = Color.fromRGBO(235, 230, 255, 1);
  static const Color cardHomeYellow = Color.fromRGBO(255, 238, 194, 1);
  static const Color cardHomeGreen = Color.fromRGBO(218, 251, 238, 1);

  // Choice Chip Home
  static const Color choiceChipHome = Color.fromRGBO(255, 226, 237, 1);

  //Colors Icons
  static const Color iconColorPersonalData = Color.fromRGBO(236, 104, 147, 1);
  static const Color iconColorAddress = Color.fromRGBO(210, 161, 59, 1);
  static const Color iconColorMyPets = Color.fromRGBO(101, 204, 164, 1);
  static const Color iconColorFavorites = Color.fromRGBO(237, 77, 77, 1);
  static const Color iconColorUserSettings = Color.fromRGBO(160, 175, 237, 1);

  static const Map<int, Color> bluePrimarySwatch = {
    50: Color.fromRGBO(126, 173, 237, 1),
    100: Color.fromRGBO(126, 173, 237, 2),
    200: Color.fromRGBO(126, 173, 237, 3),
    300: Color.fromRGBO(126, 173, 237, 4),
    400: Color.fromRGBO(126, 173, 237, 5),
    500: Color.fromRGBO(126, 173, 237, 6),
    600: Color.fromRGBO(126, 173, 237, 7),
    700: Color.fromRGBO(126, 173, 237, 8),
    800: Color.fromRGBO(126, 173, 237, 9),
    900: Color.fromRGBO(126, 173, 237, 1),
  };

  static const materialBlue =
      MaterialColor(0xFF7EADED, AppColors.bluePrimarySwatch);
}
