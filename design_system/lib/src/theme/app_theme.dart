import 'package:flutter/material.dart';

import 'app_typography.dart';
import 'colors/app_base_colors.dart';
import 'colors/app_colors.dart';

extension AppThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Gradient get linearGradient => LinearGradient(
        begin: const Alignment(-1.2, 0),
        end: const Alignment(0.8, 0),
        transform: const GradientRotation(0.7853982), //math.pi/4
        colors: [lighten(theme.primaryColor, 30), theme.primaryColor],
        //colors: [theme.primaryColor, theme.primaryColor],
      );
  Gradient getLinearGradient(Color color) => LinearGradient(
        begin: const Alignment(-1.2, 0),
        end: const Alignment(0.8, 0),
        transform: const GradientRotation(0.7853982), //math.pi/4
        colors: [lighten(color, 30), color],
        //colors: [color, color],
      );
}

/// Darken a color by [percent] amount (100 = black)
// ........................................................
Color darken(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  final f = 1 - percent / 100;
  return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
      (c.blue * f).round());
}

/// Lighten a color by [percent] amount (100 = white)
// ........................................................
Color lighten(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  final p = percent / 100;
  return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round());
}

class AppTheme {
  // ignore: long-method
  ThemeData buildThemeData({
    required MaterialColor primarySwatch,
    required MaterialColor secondarySwatch,
    required Brightness brightness,
    String fontFamily = 'Montserrat',
  }) {
    final isLight = brightness == Brightness.light;

    final doTrackColors = AppColors(brightness);

    final primaryColor =
        isLight ? primarySwatch.shade500 : primarySwatch.shade200;
    final primaryColorLight =
        isLight ? primarySwatch.shade200 : primarySwatch.shade100;
    final primaryColorDark =
        isLight ? primarySwatch.shade800 : primarySwatch.shade500;

    final secondaryColor =
        isLight ? secondarySwatch.shade500 : secondarySwatch.shade200;
    final secondaryColorDark =
        isLight ? secondarySwatch.shade800 : secondarySwatch.shade500;

    const cardTheme = CardTheme(
      elevation: 0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shadowColor: Color(0x32000000),
    );

    const sliderTheme = SliderThemeData(
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
    );

    final textButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primaryColor),
    );

    final iconTheme = IconThemeData(
      color: doTrackColors.textColor100,
      size: 24,
    );

    final appBarTheme = AppBarTheme(
      elevation: 4,
      iconTheme: iconTheme,
      backgroundColor: doTrackColors.surfaceColor50,
      foregroundColor: doTrackColors.textColor100,
    );

    return ThemeData(
      //Always have the density of smartphones, even in desktop
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardTheme: cardTheme,
      textButtonTheme: textButtonTheme,
      iconTheme: iconTheme,
      sliderTheme: sliderTheme,
      appBarTheme: appBarTheme,
      canvasColor: doTrackColors.surfaceColor50,
      cardColor: doTrackColors.surfaceColor50,
      primaryColor: primaryColor,
      shadowColor: const Color(0x32000000),
      unselectedWidgetColor: doTrackColors.textColor200,
      dividerColor: doTrackColors.textColor500,
      disabledColor: isLight ? AppBaseColors.line : AppBaseColors.label,
      primaryColorLight: primaryColorLight,
      primaryColorDark: primaryColorDark,
      dialogBackgroundColor: doTrackColors.surfaceColor50,
      colorScheme: ColorScheme(
        primary: primaryColor,
        primaryContainer: primaryColorDark,
        secondary: secondaryColor,
        secondaryContainer: secondaryColorDark,
        surface: doTrackColors.surfaceColor50,
        background: doTrackColors.surfaceColor100,
        error: doTrackColors.errorColor,
        onPrimary: doTrackColors.textColor800,
        onSecondary: doTrackColors.textColor800,
        onSurface: doTrackColors.textColor100,
        onBackground: doTrackColors.textColor300,
        onError: AppBaseColors.offBlack,
        brightness: brightness,
      ),
      brightness: brightness,
      textTheme: AppTypography().buildTextTheme(
        doTrackColors.textColor100,
        fontFamily: fontFamily,
      ),
    );
  }
}
