import 'package:flutter/material.dart';

extension AppTypographyX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

class AppTypography {
  // ignore: long-method
  TextTheme buildTextTheme(Color textColor, {required String fontFamily}) {
    return TextTheme(
      headline1: TextStyle(
        fontFamily: fontFamily,
        fontSize: 96,
        height: 1.17,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      headline2: TextStyle(
        fontFamily: fontFamily,
        fontSize: 60,
        height: 1.2,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      headline3: TextStyle(
        fontFamily: fontFamily,
        fontSize: 48,
        height: 1,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      headline4: TextStyle(
        fontFamily: fontFamily,
        fontSize: 32,
        height: 1.19,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      headline5: TextStyle(
        fontFamily: fontFamily,
        fontSize: 24,
        height: 1.17,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      headline6: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        height: 1.2,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      subtitle1: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.25,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      subtitle2: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        height: 1.14,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      bodyText1: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        height: 1.5,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodyText2: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        height: 1.5,
        letterSpacing: 0.25,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      button: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        height: 1,
        letterSpacing: 1,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      caption: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        height: 1.33,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      overline: TextStyle(
        fontFamily: fontFamily,
        fontSize: 10,
        height: 1,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
    );
  }
}
