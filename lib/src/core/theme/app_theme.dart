import 'package:flutter/material.dart';

class AppTheme {
  static const double _cardRadius = 16.0;

  static ThemeData get retailBankTheme {
    const primaryColor = Color(0xFF070FFF);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ).copyWith(primary: primaryColor),
      scaffoldBackgroundColor: Color(0xFFF9F9FD),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(_cardRadius)),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
        bodySmall: TextStyle(color: Colors.black54, fontSize: 12),
      ),
      highlightColor: Colors.green,
      disabledColor: Colors.red,
    );
  }

  static ThemeData get neoBankTheme {
    const primaryColor = Color(0xFF38DAFF);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      ).copyWith(primary: primaryColor),
      scaffoldBackgroundColor: Color(0xFF030024),
      cardTheme: CardThemeData(
        color: Color.fromRGBO(51, 54, 65, 1),
        elevation: 3,
        shadowColor: Colors.white24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(_cardRadius)),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
        bodySmall: TextStyle(color: Colors.white54, fontSize: 12),
      ),
      highlightColor: Colors.greenAccent,
      disabledColor: Colors.redAccent,
    );
  }
}
