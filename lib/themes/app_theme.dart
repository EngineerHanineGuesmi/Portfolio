import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Light Theme Colors
  static const Color _lightPrimaryColor = Color(0xFF6C63FF);
  static const Color _lightPrimaryVariant = Color(0xFF4A45B1);
  static const Color _lightSecondaryColor = Color(0xFF00BFA6);
  static const Color _lightBackgroundColor = Color(0xFFF8F9FF);
  static const Color _lightSurfaceColor = Colors.white;
  static const Color _lightErrorColor = Color(0xFFE53935);
  static const Color _lightOnPrimaryColor = Colors.white;
  static const Color _lightOnSecondaryColor = Colors.black;
  static const Color _lightOnBackgroundColor = Color(0xFF1A1A2E);
  static const Color _lightOnSurfaceColor = Color(0xFF1A1A2E);
  static const Color _lightOnErrorColor = Colors.white;

  // Dark Theme Colors
  static const Color _darkPrimaryColor = Color(0xFF7C4DFF);
  static const Color _darkPrimaryVariant = Color(0xFF651FFF);
  static const Color _darkSecondaryColor = Color(0xFF00E5FF);
  static const Color _darkBackgroundColor = Color(0xFF121212);
  static const Color _darkSurfaceColor = Color(0xFF1E1E1E);
  static const Color _darkErrorColor = Color(0xFFCF6679);
  static const Color _darkOnPrimaryColor = Colors.black;
  static const Color _darkOnSecondaryColor = Colors.black;
  static const Color _darkOnBackgroundColor = Color(0xFFE6E6E6);
  static const Color _darkOnSurfaceColor = Color(0xFFE6E6E6);
  static const Color _darkOnErrorColor = Colors.black;

  // Text Theme
  static TextTheme _buildTextTheme(TextTheme base, Color textColor) {
    return GoogleFonts.poppinsTextTheme(base).copyWith(
      displayLarge: GoogleFonts.poppins(
        color: textColor,
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.poppins(
        color: textColor,
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      displaySmall: GoogleFonts.poppins(
        color: textColor,
        fontSize: 48,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: GoogleFonts.poppins(
        color: textColor,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headlineSmall: GoogleFonts.poppins(
        color: textColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: GoogleFonts.poppins(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      titleMedium: GoogleFonts.poppins(
        color: textColor.withOpacity(0.9),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.poppins(
        color: textColor.withOpacity(0.6),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: textColor.withOpacity(0.9),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: textColor.withOpacity(0.9),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      labelLarge: GoogleFonts.poppins(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      ),
      bodySmall: GoogleFonts.poppins(
        color: textColor.withOpacity(0.6),
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      labelSmall: GoogleFonts.poppins(
        color: textColor.withOpacity(0.6),
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    );
  }

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: _lightPrimaryColor,
    primaryColorDark: _lightPrimaryVariant,
    primaryColorLight: _lightPrimaryColor.withOpacity(0.1),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryContainer: _lightPrimaryVariant,
      secondary: _lightSecondaryColor,
      secondaryContainer: _lightSecondaryColor.withOpacity(0.2),
      background: _lightBackgroundColor,
      surface: _lightSurfaceColor,
      error: _lightErrorColor,
      onPrimary: _lightOnPrimaryColor,
      onSecondary: _lightOnSecondaryColor,
      onBackground: _lightOnBackgroundColor,
      onSurface: _lightOnSurfaceColor,
      onError: _lightOnErrorColor,
    ),
    scaffoldBackgroundColor: _lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _lightSurfaceColor,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: _lightOnBackgroundColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: _lightOnBackgroundColor),
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: _lightSurfaceColor,
    ),
    textTheme:
        _buildTextTheme(ThemeData.light().textTheme, _lightOnBackgroundColor),
    iconTheme: const IconThemeData(color: _lightOnBackgroundColor),
    dividerColor: Colors.grey[300],
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: _lightPrimaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: _lightErrorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: _lightErrorColor, width: 2),
      ),
      labelStyle: const TextStyle(color: Colors.grey),
      hintStyle: const TextStyle(color: Colors.grey),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _lightPrimaryColor,
        foregroundColor: _lightOnPrimaryColor,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _lightPrimaryColor,
        side: const BorderSide(color: _lightPrimaryColor),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _lightPrimaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _lightPrimaryColor,
      foregroundColor: _lightOnPrimaryColor,
      elevation: 2,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _lightSurfaceColor,
      selectedItemColor: _lightPrimaryColor,
      unselectedItemColor: Colors.grey[600],
      selectedLabelStyle:
          const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle:
          const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      type: BottomNavigationBarType.fixed,
      elevation: 4,
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: _lightPrimaryColor,
      unselectedLabelColor: Colors.grey[600],
      labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      unselectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: _lightPrimaryColor, width: 2),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[300],
      thickness: 1,
      space: 1,
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(4),
      ),
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: _darkPrimaryColor,
    primaryColorDark: _darkPrimaryVariant,
    primaryColorLight: _darkPrimaryColor.withOpacity(0.1),
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      primaryContainer: _darkPrimaryVariant,
      secondary: _darkSecondaryColor,
      secondaryContainer: _darkSecondaryColor.withOpacity(0.2),
      background: _darkBackgroundColor,
      surface: _darkSurfaceColor,
      error: _darkErrorColor,
      onPrimary: _darkOnPrimaryColor,
      onSecondary: _darkOnSecondaryColor,
      onBackground: _darkOnBackgroundColor,
      onSurface: _darkOnSurfaceColor,
      onError: _darkOnErrorColor,
    ),
    scaffoldBackgroundColor: _darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _darkSurfaceColor,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: _darkOnBackgroundColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: _darkOnBackgroundColor),
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: _darkSurfaceColor,
    ),
    textTheme:
        _buildTextTheme(ThemeData.dark().textTheme, _darkOnBackgroundColor),
    iconTheme: const IconThemeData(color: _darkOnBackgroundColor),
    dividerColor: Colors.grey[800],
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _darkSurfaceColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[800]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[800]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: _darkPrimaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: _darkErrorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: _darkErrorColor, width: 2),
      ),
      labelStyle: TextStyle(color: Colors.grey[400]),
      hintStyle: TextStyle(color: Colors.grey[400]),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _darkPrimaryColor,
        foregroundColor: _darkOnPrimaryColor,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _darkPrimaryColor,
        side: const BorderSide(color: _darkPrimaryColor),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _darkPrimaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _darkPrimaryColor,
      foregroundColor: _darkOnPrimaryColor,
      elevation: 2,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _darkSurfaceColor,
      selectedItemColor: _darkPrimaryColor,
      unselectedItemColor: Colors.grey[400],
      selectedLabelStyle:
          const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle:
          const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      type: BottomNavigationBarType.fixed,
      elevation: 4,
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: _darkPrimaryColor,
      unselectedLabelColor: Colors.grey[400],
      labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      unselectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: _darkPrimaryColor, width: 2),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[800],
      thickness: 1,
      space: 1,
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(4),
      ),
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
