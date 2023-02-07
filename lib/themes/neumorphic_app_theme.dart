import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:spacha_maker/themes/app_colors.dart';

NeumorphicThemeData neumorphicTheme(BuildContext context) {
  return const NeumorphicThemeData(
    defaultTextColor: Color(0xFF303E57),
    accentColor: Color(0xFF7B79FC),
    variantColor: Colors.black38,
    baseColor: white,
    depth: 10,
    intensity: 0.5,
    iconTheme: IconThemeData(
      // color: tsukuttaOrange,
      size: 30,
    ),
    appBarTheme: NeumorphicAppBarThemeData(),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.5,
        color: textPrimary,
      ),
      displayMedium: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        color: textPrimary,
      ),
      displaySmall: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        color: textPrimary,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.25,
        color: textPrimary,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        color: textPrimary,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.15,
        color: textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.15,
        color: textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.15,
        color: textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.15,
        color: textPrimary,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.1,
        color: textPrimary,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.25,
        color: textPrimary,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.4,
        color: textPrimary,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        letterSpacing: 1.5,
        color: textPrimary,
      ),
    ),
  );
}
