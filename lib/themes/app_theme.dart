import 'package:flutter/material.dart';
import 'package:spacha_maker/themes/app_colors.dart';

ThemeData theme(BuildContext context) => ThemeData(
      //colorScheme: const ColorScheme.light().copyWith(secondary: secondary),
      brightness: Brightness.light,
      primaryColor: background,
      dividerColor: divider,
      errorColor: error,
      scaffoldBackgroundColor: background,
      backgroundColor: background,
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

      fontFamily: 'NotoSansJP',
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: white,
        // backgroundColor: tsukuttaOrange,
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
        headline1: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.5,
          color: textPrimary,
        ),
        headline2: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
          color: textPrimary,
        ),
        headline3: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: 0,
          color: textPrimary,
        ),
        headline4: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.25,
          color: textPrimary,
        ),
        headline5: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 0,
          color: textPrimary,
        ),
        headline6: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.15,
          color: textPrimary,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.15,
          color: textPrimary,
        ),
        bodyText2: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.15,
          color: textPrimary,
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.15,
          color: textPrimary,
        ),
        subtitle2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.1,
          color: textPrimary,
        ),
        button: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.25,
          color: textPrimary,
        ),
        caption: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.4,
          color: textPrimary,
        ),
        overline: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          letterSpacing: 1.5,
          color: textPrimary,
        ),
      ),
    );
