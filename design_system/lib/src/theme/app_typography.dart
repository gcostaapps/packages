import 'package:flutter/material.dart';

extension AppTypographyX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

class AppTypography {
  // ignore: long-method
  TextTheme buildTextTheme(Color textColor, {required String fontFamily}) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 96,
        height: 1.17,
        fontWeight: FontWeight.w300,
        color: textColor,
        letterSpacing: -1.5,
      ),
      displayMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 60,
        height: 1.2,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: -0.5,
      ),
      displaySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 48,
        height: 1,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 32,
        height: 1.19,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0.25,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 24,
        height: 1.17,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0,
      ),
      titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        height: 1.2,
        fontWeight: FontWeight.w500,
        color: textColor,
        letterSpacing: 0.15,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.25,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        height: 1.14,
        fontWeight: FontWeight.w500,
        color: textColor,
        letterSpacing: 0.1,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        height: 1.5,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        height: 1.5,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0.25,
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        height: 1,
        fontWeight: FontWeight.w500,
        color: textColor,
        letterSpacing: 1.25,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        height: 1.33,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0.4,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        fontSize: 10,
        height: 1,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 1.5,
      ),
    );
  }
}
