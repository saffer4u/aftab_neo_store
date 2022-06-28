import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: RED_COLOR700,
  visualDensity: VisualDensity.adaptivePlatformDensity,

  // fontFamily: 'GothamBold',
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 35,
      color: WHITE_COLOR,
      fontFamily: Font.GothamBold,
    ),
    headline2: TextStyle(
      fontSize: 28,
      color: WHITE_COLOR,
      fontFamily: Font.GothamBold,
    ),
    headline3: TextStyle(
      fontSize: 13,
      color: Colors.white,
      fontFamily: Font.GothamMedium,
    ),
    headline4: TextStyle(
      fontFamily: Font.Gotham,
      color: WHITE_COLOR,
      fontSize: 14,
    ),
    headline5: TextStyle(
      fontFamily: Font.Gotham,
      color: WHITE_COLOR,
      fontSize: 12,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: WHITE_COLOR,
  ),
);
