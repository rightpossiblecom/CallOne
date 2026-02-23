import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors matching the Landing Page (Amber & Rose)
  static const Color _primaryAmber = Color(0xFFF59E0B);
  static const Color _accentRose = Color(0xFFF43F5E);

  static const Color _backgroundLight = Color(0xFFFAFAFA);
  static const Color _foregroundLight = Color(0xFF171717);

  static const Color _backgroundDark = Color(0xFF0A0A0A);
  static const Color _foregroundDark = Color(0xFFFAFAFA);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryAmber,
      brightness: Brightness.light,
      primary: _primaryAmber,
      secondary: _accentRose,
      surface: _backgroundLight,
      onSurface: _foregroundLight,
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
    appBarTheme: const AppBarTheme(
      backgroundColor: _backgroundLight,
      foregroundColor: _foregroundLight,
      elevation: 0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: _backgroundLight,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryAmber,
      brightness: Brightness.dark,
      primary: _primaryAmber,
      secondary: _accentRose,
      surface: _backgroundDark,
      onSurface: _foregroundDark,
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    appBarTheme: const AppBarTheme(
      backgroundColor: _backgroundDark,
      foregroundColor: _foregroundDark,
      elevation: 0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: _backgroundDark,
  );
}
