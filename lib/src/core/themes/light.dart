import 'package:flutter/material.dart'
    show Brightness, Color, ColorScheme, Colors, ThemeData;

ThemeData lightTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFF4285F4), // Google's blue
    brightness: Brightness.light,

    // Surface tones (backgrounds, cards)
    surface: Color(0xFFF5F7F8), // light gray background
    surfaceDim: Color(0xFFE0E0E0),
    surfaceBright: Color(0xFFFFFFFF),
    surfaceTint: Color(0xFF4285F4),
    inverseSurface: Color(0xFF202124),
    onSurface: Color(0xFF3C4043),
    onInverseSurface: Color(0xFFF1F3F4),

    surfaceContainer: Color(0xFFE8EAED),
    surfaceContainerLow: Color(0xFFF1F3F4),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerHigh: Color(0xFFE0E0E0),
    surfaceContainerHighest: Color(0xFFCCCCCC),
    onSurfaceVariant: Color(0xFF5F6368),

    // Primary (main accent - blue)
    primary: Colors.black,
    inversePrimary: Color(0xFF8AB4F8),
    onPrimary: Colors.white,
    primaryFixed: Color(0xFF185ABC),
    onPrimaryFixed: Colors.white,
    onPrimaryFixedVariant: Color(0xFF174EA6),
    primaryContainer: Color(0xFFD2E3FC),
    onPrimaryContainer: Color(0xFF174EA6),

    // Secondary (recent activity icons - grey tones)
    secondary: Color(0xFF5F6368),
    onSecondary: Colors.white,
    secondaryFixed: Color(0xFF9AA0A6),
    onSecondaryFixed: Color(0xFF202124),
    onSecondaryFixedVariant: Color(0xFF70757A),
    secondaryContainer: Color(0xFFE8EAED),
    onSecondaryContainer: Color(0xFF202124),

    // Tertiary (highlight/red/pink - alert or special elements)
    tertiary: Color(0xFFEA4335), // Google Red
    onTertiary: Colors.white,
    tertiaryFixed: Color(0xFFDB4437),
    onTertiaryFixed: Color(0xFFFFFFFF),
    onTertiaryFixedVariant: Color(0xFFB31412),
    tertiaryContainer: Color(0xFFFCE8E6),
    onTertiaryContainer: Color(0xFFB31412),

    // Outline and shadows
    outline: Color(0xFFBDC1C6),
    outlineVariant: Color(0xFFE0E0E0),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
  ),
);
