import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // "Modern Chic Rose" palette

  // Light Theme Colors
  static const Color _lightPrimaryColor = Color(0xFFB85D75); // rose
  static const Color _lightPrimaryVariant = Color(0xFF8E3F55); // deep rose
  static const Color _lightSecondaryColor = Color(0xFFD9BFA0); // sand
  static const Color _lightTertiaryColor = Color(0xFFD48C9E); // blush
  static const Color _lightBackgroundColor = Color(0xFFF8EBEE);
  static const Color _lightSurfaceColor = Color(0xFFFDF5F7);
  static const Color _lightErrorColor = Color(0xFFB3261E);
  static const Color _lightOnPrimaryColor = Colors.white;
  static const Color _lightOnSecondaryColor = Color(0xFF3B3335);
  static const Color _lightOnBackgroundColor = Color(0xFF3B3335); // warm charcoal
  static const Color _lightOnSurfaceColor = Color(0xFF3B3335);
  static const Color _lightOnErrorColor = Colors.white;
  static const Color _lightOutlineColor = Color(0xFFE6D3D8);

  // Dark Theme Colors
  static const Color _darkPrimaryColor = Color(0xFFE2829B); // rose
  static const Color _darkPrimaryVariant = Color(0xFFF3A6B8); // blush
  static const Color _darkSecondaryColor = Color(0xFFF3D5B5); // champagne
  static const Color _darkTertiaryColor = Color(0xFFF3A6B8);
  static const Color _darkBackgroundColor = Color(0xFF120E11);
  static const Color _darkSurfaceColor = Color(0xFF1E191C);
  static const Color _darkErrorColor = Color(0xFFF2B8B5);
  static const Color _darkOnPrimaryColor = Color(0xFF3A0F1C);
  static const Color _darkOnSecondaryColor = Color(0xFF2E2217);
  static const Color _darkOnBackgroundColor = Color(0xFFEDE3E6);
  static const Color _darkOnSurfaceColor = Color(0xFFEDE3E6);
  static const Color _darkOnErrorColor = Color(0xFF601410);
  static const Color _darkOutlineColor = Color(0xFF3A3236);

  // Text Theme
  static TextTheme _buildTextTheme(TextTheme base, Color textColor) {
    return GoogleFonts.manropeTextTheme(base).copyWith(
      displayLarge: GoogleFonts.playfairDisplay(
        color: textColor,
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.playfairDisplay(
        color: textColor,
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      displaySmall: GoogleFonts.playfairDisplay(
        color: textColor,
        fontSize: 48,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: GoogleFonts.playfairDisplay(
        color: textColor,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headlineSmall: GoogleFonts.playfairDisplay(
        color: textColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: GoogleFonts.manrope(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      titleMedium: GoogleFonts.manrope(
        color: textColor.withOpacity(0.9),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.manrope(
        color: textColor.withOpacity(0.6),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyLarge: GoogleFonts.manrope(
        color: textColor.withOpacity(0.9),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.manrope(
        color: textColor.withOpacity(0.9),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      labelLarge: GoogleFonts.manrope(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      ),
      bodySmall: GoogleFonts.manrope(
        color: textColor.withOpacity(0.6),
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      labelSmall: GoogleFonts.manrope(
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
      tertiary: _lightTertiaryColor,
      outline: _lightOutlineColor,
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
    dividerColor: _lightOutlineColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _lightSurfaceColor,
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
    dividerTheme: const DividerThemeData(
      color: _lightOutlineColor,
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
      tertiary: _darkTertiaryColor,
      outline: _darkOutlineColor,
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
    dividerColor: _darkOutlineColor,
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
    dividerTheme: const DividerThemeData(
      color: _darkOutlineColor,
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
