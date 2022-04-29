import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  ThemeController(this.primarySwatch, {this.secondarySwatch}) {
    lightTheme = AppTheme().buildThemeData(
      primarySwatch: primarySwatch,
      secondarySwatch: secondarySwatch ?? primarySwatch,
      brightness: Brightness.light,
      fontFamily: 'Montserrat',
    );

    darkTheme = AppTheme().buildThemeData(
      primarySwatch: primarySwatch,
      secondarySwatch: secondarySwatch ?? primarySwatch,
      brightness: Brightness.dark,
      fontFamily: 'Montserrat',
    );
  }

  void changeTheme(MaterialColor primarySwatch,
      {MaterialColor? secondarySwatch}) {
    lightTheme = AppTheme().buildThemeData(
      primarySwatch: primarySwatch,
      secondarySwatch: secondarySwatch ?? primarySwatch,
      brightness: Brightness.light,
      fontFamily: 'Montserrat',
    );

    darkTheme = AppTheme().buildThemeData(
      primarySwatch: primarySwatch,
      secondarySwatch: secondarySwatch ?? primarySwatch,
      brightness: Brightness.dark,
      fontFamily: 'Montserrat',
    );
    notifyListeners();
  }

  final MaterialColor primarySwatch;
  final MaterialColor? secondarySwatch;

  late ThemeData lightTheme;
  late ThemeData darkTheme;
}
