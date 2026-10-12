import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryGreen = Color(0xFF0B3C26);
  static const Color darkGreenVariant = Color(0xFF062417);
  static const Color bodaYellow = Color(0xFFFFC107);
  static const Color bodaYellowDark = Color(0xFFFFA000);
  static const Color bgDark = Color(0xFF121C17);
  static const Color cardDark = Color(0xFF1A2A23);
  static const Color inputBg = Color(0xFF283D33);
  static const Color incomeGreen = Color(0xFF2ECC71);
  static const Color expenseRed = Color(0xFFE74C3C);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textGray = Color(0xFFA0B0A8);

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: bgDark,
      primaryColor: bodaYellow,
      colorScheme: const ColorScheme.dark(
        primary: bodaYellow,
        secondary: incomeGreen,
        surface: cardDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryGreen,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: bodaYellow,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
