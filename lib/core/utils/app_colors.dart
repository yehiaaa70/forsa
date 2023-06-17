import 'package:flutter/material.dart';

import 'hex_color.dart';

class AppColors {
  static Color primary = HexColor('#64B7EF');
  static Color secondPrimary = HexColor('#171560');

  static Color scaffoldBackground = HexColor('#f3faff');
  static Color buttonBackground = HexColor('#594339');
  static Color textBackground = HexColor('#92603F');
  static Color onBoardingColor = HexColor('#DC8068');
  static Color containerBackgroundColor = HexColor('#F7DFB1');
  static Color iconBackgroundColor = HexColor('#402D26');
  static Color gray1 = HexColor('#404040');
  static Color unselectedTab = HexColor('#D9D9D9');
  static Color commentBackground = HexColor('#F3F2F2');
  static Color iconProfileColor = HexColor('#143360');

  static List<Color> linearColors = [
    primary.withOpacity(0.9),
    primary.withOpacity(0.9),
    primary.withOpacity(0.8),
    primary.withOpacity(0.8),
    primary.withOpacity(0.7),
    primary.withOpacity(0.7),
    primary.withOpacity(0.6),
    primary.withOpacity(0.6),
    primary.withOpacity(0.5),
    primary.withOpacity(0.5),
    primary.withOpacity(0.4),
    primary.withOpacity(0.4),
    primary.withOpacity(0.4),
    primary.withOpacity(0.3),
    primary.withOpacity(0.3),
    primary.withOpacity(0.3),
    primary.withOpacity(0.2),
    primary.withOpacity(0.2),
    primary.withOpacity(0.2),
    primary.withOpacity(0.1),
    primary.withOpacity(0.1),
    primary.withOpacity(0.1),
  ];
  static List<Color> linearNotification1Colors = [
    primary.withOpacity(0.7),
    primary.withOpacity(0.5),
    primary.withOpacity(0.4),
    primary.withOpacity(0.3),
    primary.withOpacity(0.2),
    primary.withOpacity(0.2),
    primary.withOpacity(0.1),
    primary.withOpacity(0.1),

  ];
  static List<Color> linearNotification2Colors = [
    error.withOpacity(0.7),
    error.withOpacity(0.5),
    error.withOpacity(0.4),
    error.withOpacity(0.3),
    error.withOpacity(0.2),
    error.withOpacity(0.2),
    error.withOpacity(0.1),
    error.withOpacity(0.1),
    error.withOpacity(0.1),
  ];

  static Color blueColor1 = HexColor('#6A85B6');
  static Color blueColor2 = HexColor('#BAC8E0');

  static Color blueLiteColor1 = HexColor('#429993');
  static Color blueLiteColor2 = HexColor('#7CD4CC');

  static Color hint = Colors.grey;
  static Color blackLite = Colors.black12;
  static Color error = Colors.red;
  static Color success = Colors.green;
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color gray = Colors.grey;
  static Color grayLite = Colors.grey[700]!;
  static Color opacityWhite = Colors.white.withOpacity(0.5);
  static Color transparent = Colors.transparent;
}
