import 'package:flutter/material.dart'
    show
        BorderRadius,
        BorderSide,
        Color,
        InputDecorationTheme,
        OutlineInputBorder,
        ThemeData;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static final purple = Color(0xFF5117AC);
  static final green = Color(0xFF20D0C4);
  static final dark = Color(0xFF03091E);
  static final grey = Color(0xFF212738);
  static final lightGrey = Color(0xFFBBBBBB);
  static final veryLightGrey = Color(0xFFF3F3F3);
  static final white = Color(0xFFFFFFFF);
  static final pink = Color(0xFFf5638B);
}

final _borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
      width: 2, color: DeliveryColors.dark, style: BorderStyle.solid),
);

final _borderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
      width: 2, color: DeliveryColors.veryLightGrey, style: BorderStyle.solid),
);

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
      color: DeliveryColors.white,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          headline6: TextStyle(
              fontSize: 20,
              color: DeliveryColors.purple,
              fontWeight: FontWeight.bold))),
  bottomAppBarColor: DeliveryColors.veryLightGrey,
  canvasColor: DeliveryColors.white,
  accentColor: DeliveryColors.purple,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: DeliveryColors.purple, displayColor: DeliveryColors.purple),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: DeliveryColors.white),
    contentPadding: EdgeInsets.zero,
    border: _borderLight,
    enabledBorder: _borderLight,
    focusedBorder: _borderLight,
    hintStyle:
        GoogleFonts.poppins(color: DeliveryColors.lightGrey, fontSize: 12),
  ),
  iconTheme: IconThemeData(color: DeliveryColors.purple),
  accentIconTheme: IconThemeData(color: DeliveryColors.purple),
  primaryIconTheme: IconThemeData(color: DeliveryColors.purple),
);

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: DeliveryColors.purple,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline6: TextStyle(
          fontSize: 20,
          color: DeliveryColors.white,
          fontWeight: FontWeight.bold),
      caption: TextStyle(color: DeliveryColors.green),
    ),
  ),
  bottomAppBarColor: Colors.transparent,
  canvasColor: DeliveryColors.grey,
  accentColor: DeliveryColors.white,
  scaffoldBackgroundColor: DeliveryColors.dark,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: DeliveryColors.green, displayColor: DeliveryColors.white),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: DeliveryColors.green),
    contentPadding: EdgeInsets.zero,
    border: _borderDark,
    enabledBorder: _borderDark,
    focusedBorder: _borderDark,
    filled: true,
    fillColor: DeliveryColors.grey,
    hintStyle: GoogleFonts.poppins(color: DeliveryColors.white, fontSize: 12),
  ),
  iconTheme: IconThemeData(color: DeliveryColors.white),
  accentIconTheme: IconThemeData(color: DeliveryColors.white),
  primaryIconTheme: IconThemeData(color: DeliveryColors.white),
);
final deliveryGradient = [
  DeliveryColors.green,
  DeliveryColors.purple,
];
