import 'package:flutter/material.dart';

class AppBaseColors {
  //Grayscale Colors
  static const Color offBlack = Color(0xFF14142B);
  static const Color ash = Color(0xFF262338);
  static const Color body = Color(0xFF4E4B66);
  static const Color label = Color(0xFF6E7191);
  static const Color placeholder = Color(0xFFA0A3BD);
  static const Color line = Color(0xFFD9DBE9);
  static const Color input = Color(0xFFEFF0F6);
  static const Color background = Color(0xFFF7F7FC);
  static const Color offWhite = Color(0xFFFCFCFC);

  static MaterialColor errorColor = const MaterialColor(0xFFED2E3E, {
    50: Color(0xFFFFF3F8),
    100: Color(0xFFFBE9E9),
    200: Color(0xFFFE6161),
    300: Color(0xFFED2E3E),
    400: Color(0xFFB8004E),
  });

  static MaterialColor successColor = const MaterialColor(0xFF00BA88, {
    50: Color(0xFFF2FFFB),
    100: Color(0xFFE7FCF6),
    200: Color(0xFF34EAB9),
    300: Color(0xFF00BA88),
    400: Color(0xFF00805D),
  });

  static MaterialColor warningColor = const MaterialColor(0xFFF4B740, {
    50: Color(0xFFFFF9EF),
    100: Color(0xFFFFF6E4),
    200: Color(0xFFFFDB94),
    300: Color(0xFFF4B740),
    400: Color(0xFF946200),
  });

  static const MaterialColor lightTextColors = MaterialColor(
    0xFFFCFCFC,
    {
      50: Color(0xFF14142B),
      100: Color(0xFF262338),
      200: Color(0xFF4E4B66),
      300: Color(0xFF6E7191),
      400: Color(0xFFA0A3BD),
      500: Color(0xFFD9DBE9),
      600: Color(0xFFEFF0F6),
      700: Color(0xFFF7F7FC),
      800: Color(0xFFFCFCFC),
    },
  );

  static const MaterialColor darkTextColors = MaterialColor(
    0xFF14142B,
    {
      800: Color(0xFF14142B),
      700: Color(0xFF262338),
      600: Color(0xFF4E4B66),
      500: Color(0xFF6E7191),
      400: Color(0xFFA0A3BD),
      300: Color(0xFFD9DBE9),
      200: Color(0xFFEFF0F6),
      100: Color(0xFFF7F7FC),
      50: Color(0xFFFCFCFC),
    },
  );

  static const MaterialColor lightSurfaceColors = MaterialColor(
    0xFFFCFCFC,
    {
      50: Color(0xFFFCFCFC),
      100: Color(0xFFF7F7FC),
      200: Color(0xFFEFF0F6),
    },
  );

  static const MaterialColor darkSurfaceColors = MaterialColor(
    0x7F2F3565,
    {
      50: Color(0xFF39394C), //0xFF201B2C
      100: Color(0xFF202035), //0xFF171520
      200: Color(0xFF202035), //0xFF251F33
    },
  );

  static const MaterialColor chili = MaterialColor(
    0xFFFF0000,
    chiliSwatch,
  );

  static const Map<int, Color> chiliSwatch = {
    50: Color(0xFFFFF5F5),
    100: Color(0xFFFFDBDB),
    200: Color(0xFFFF9999),
    300: Color(0xFFFF6666),
    400: Color(0xFFFF4C4D),
    500: Color(0xFFFF0000),
    600: Color(0xFFE50000),
    700: Color(0xFFCC0000),
    800: Color(0xFF990000),
    900: Color(0xFF660000),
  };

  static const MaterialColor tiger = MaterialColor(
    0xFFFF7500,
    tigerSwatch,
  );

  static const Map<int, Color> tigerSwatch = {
    50: Color(0xFFFFF9F5),
    100: Color(0xFFFFECDB),
    200: Color(0xFFFFC899),
    300: Color(0xFFFFAC66),
    400: Color(0xFFFFAC66),
    500: Color(0xFFFF7500),
    600: Color(0xFFE56900),
    700: Color(0xFFCC5E00),
    800: Color(0xFF994600),
    900: Color(0xFF662F00),
  };

  static const MaterialColor dark = MaterialColor(
    0xFF14142B,
    darkSwatch,
  );

  static const Map<int, Color> darkSwatch = {
    50: Color(0xFFFCFCFC),
    100: Color(0xFFFCFCFC),
    200: Color(0xFFFCFCFC),
    300: Color(0xFF373949),
    400: Color(0xFF21222C),
    500: Color(0xFF14142A),
    600: Color(0xFF14142A),
    700: Color(0xFF14142A),
    800: Color(0xFF14142A),
    900: Color(0xFF14142A),
  };

  static const MaterialColor teal = MaterialColor(
    0xFF00857A,
    tealSwatch,
  );

  static const Map<int, Color> tealSwatch = {
    50: Color(0xFFF5FFFD),
    100: Color(0xFFE0FFF8),
    200: Color(0xFF41F8E1),
    300: Color(0xFF41F8E1),
    400: Color(0xFF41F8E1),
    500: Color(0xFF00857A),
    600: Color(0xFF00857A),
    700: Color(0xFF007A70),
    800: Color(0xFF005649),
    900: Color(0xFF003F31),
  };

  static const MaterialColor blue = MaterialColor(
    0xFF0576F0,
    blueSwatch,
  );

  static const Map<int, Color> blueSwatch = {
    50: Color(0xFFF5F7FF),
    100: Color(0xFFE3FEFF),
    200: Color(0xFF2AA8F8),
    300: Color(0xFF50C8FC),
    400: Color(0xFF2AA8F8),
    500: Color(0xFF0576F0),
    600: Color(0xFF005BD4),
    700: Color(0xFF0041AC),
    800: Color(0xFF002463),
    900: Color(0xFF002463),
  };

  static const MaterialColor ocean = MaterialColor(
    0xFF00BAFF,
    oceanSwatch,
  );

  static const Map<int, Color> oceanSwatch = {
    50: Color(0xFFF5FCFF),
    100: Color(0xFFDBF5FF),
    200: Color(0xFF99E3FF),
    300: Color(0xFF66D6FF),
    400: Color(0xFF4CCFFF),
    500: Color(0xFF00BAFF),
    600: Color(0xFF00A7E5),
    700: Color(0xFF0095CC),
    800: Color(0xFF007099),
    900: Color(0xFF004A66),
  };

  static const MaterialColor lavender = MaterialColor(
    0xFF6308F7,
    lavenderSwatch,
  );

  static const Map<int, Color> lavenderSwatch = {
    50: Color(0xFFF9F5FF),
    100: Color(0xFFE9DCFE),
    200: Color(0xFFC19CFC),
    300: Color(0xFFA26BFA),
    400: Color(0xFF9252FA),
    500: Color(0xFF6308F7),
    600: Color(0xFF5907DE),
    700: Color(0xFF4F06C6),
    800: Color(0xFF3C0594),
    900: Color(0xFF280363),
  };

  static const MaterialColor magenta = MaterialColor(
    0xFFFF00C9,
    magentaSwatch,
  );

  static const Map<int, Color> magentaSwatch = {
    50: Color(0xFFFFF5FD),
    100: Color(0xFFFFDBF7),
    200: Color(0xFFFF99E9),
    300: Color(0xFFFF66DF),
    400: Color(0xFFFF4CD9),
    500: Color(0xFFFF00C9),
    600: Color(0xFFE500B5),
    700: Color(0xFFCC00A1),
    800: Color(0xFF990079),
    900: Color(0xFF660050),
  };

  static const MaterialColor pink = MaterialColor(
    0xFFFE017F,
    pinkSwatch,
  );

  static const Map<int, Color> pinkSwatch = {
    50: Color(0xFFFFECFC),
    100: Color(0xFFFFABE8),
    200: Color(0xFFFF75CB),
    300: Color(0xFFFE67B2),
    400: Color(0xFFFF54AF),
    500: Color(0xFFE3026F),
    600: Color(0xFFCA024F),
    700: Color(0xFF9E0038),
    800: Color(0xFF5B001E),
    900: Color(0xFF360113),
  };

  static MaterialColor lemon = const MaterialColor(
    0xFFF9F906,
    lemonSwatch,
  );

  static const Map<int, Color> lemonSwatch = {
    50: Color(0xFFFFFFF5),
    100: Color(0xFFFEFEDC),
    200: Color(0xFFFDFD9B),
    300: Color(0xFFFBFB6A),
    400: Color(0xFFFBFB51),
    500: Color(0xFFF9F906),
    600: Color(0xFFE0E005),
    700: Color(0xFFC7C705),
    800: Color(0xFF959504),
    900: Color(0xFF646402),
  };

  static MaterialColor warm = const MaterialColor(
    0xFF837C7C,
    warmSwatch,
  );

  static const Map<int, Color> warmSwatch = {
    50: Color(0xFFFAFAFA),
    100: Color(0xFFEEEDED),
    200: Color(0xFFCDCBCB),
    300: Color(0xFFB5B0B0),
    400: Color(0xFFA8A3A3),
    500: Color(0xFF837C7C),
    600: Color(0xFF767070),
    700: Color(0xFF5C5757),
    800: Color(0xFF413E3E),
    900: Color(0xFF272525),
  };

  static const MaterialColor esmerald = MaterialColor(
    0xFF00FFC7,
    esmeraldSwatch,
  );

  static const Map<int, Color> esmeraldSwatch = {
    50: Color(0xFFF5FFFD),
    100: Color(0xFFDBFFF7),
    200: Color(0xFF99FFE9),
    300: Color(0xFF66FFDD),
    400: Color(0xFF4CFFD8),
    500: Color(0xFF00FFC7),
    600: Color(0xFF00E5B3),
    700: Color(0xFF00CC9F),
    800: Color(0xFF009977),
    900: Color(0xFF006650),
  };
}
