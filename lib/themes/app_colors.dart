import 'package:flutter/material.dart';

const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;
const Color textPrimary = Color(0xff1F1F1F);
const Color textSecondary = Color(0xff47576D);
const Color textDisable = Color(0xffABABAB);
const Color divider = Color(0xffE7E7E7);
const Color background = Color(0xffF6F5FA);

const Color error = Color(0xFFB00020);
const Color selectable = Color(0xFF007AFF);
const Color unSelectable = Color(0xffB3B8BF);
const Color textFieldBackground = Color(0xffFAFAF5);

const Color spachaBlue = Color(0xFF1665C1);

const Color spachaCyan = Color(0xFF01B9D5);
const Color spachaLightCyan = Color(0xFF00E4FF);

const Color spachaGreen = Color(0xFF02BEA5);
const Color spachaLightGreen = Color(0xFF1EE8B6);

const Color spachaYellow = Color(0xFFFFB200);
const Color spachaLightYellow = Color(0xFFFECA27);

const Color spachaOrange = Color(0xFFE65100);
const Color spachaLightOrange = Color(0xFFF87A01);

const Color spachaMagenta = Color(0xFFC2185B);
const Color spachaLightMagenta = Color(0xFFEA1E63);

const Color spachaRed = Color(0xFFD00000);
const Color spachaLightRed = Color(0xFFE62119);

const Color cursorColor = Color(0xFF456BF3);
const Color keyboardBarColor = Color(0xffEFF0F1);
const Color keyboardSeparatorColor = Color(0xff919398);

Color hexToColor(String colorCode) {
  return Color(int.parse('0xff$colorCode'));
}
