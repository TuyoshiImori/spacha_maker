import 'package:flutter/material.dart';
import 'package:spacha_maker/themes/app_colors.dart';

ThemeData theme(BuildContext context) => ThemeData(
      //colorScheme: const ColorScheme.light().copyWith(secondary: secondary),
      brightness: Brightness.light,
      primaryColor: background,
      dividerColor: divider,
      scaffoldBackgroundColor: background,
      iconTheme: const IconThemeData(
        // color: tsukuttaOrange,
        size: 30,
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          size: 25,
        ),
        color: background,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: black,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          // selectedItemColor: tsukuttaOrange,
          // unselectedItemColor: black,
          ),

      //fontFamily: 'NotoSansJP',
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: white,
        backgroundColor: spachaLightYellow,
      ),
      listTileTheme: const ListTileThemeData(textColor: black),
      dividerTheme: const DividerThemeData(
        color: divider,
        thickness: 1,
        space: 0,
      ),
      // https://material.io/go/design-typography#typography-styles
      textSelectionTheme: const TextSelectionThemeData(
          //cursorColor: black,
          //selectionColor: black,
          //selectionHandleColor: AppColors.selectionHandleColor,
          ),
      textTheme: const TextTheme(
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
