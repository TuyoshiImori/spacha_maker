import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spacha_maker/themes/app_colors.dart';
import 'package:spacha_maker/ui/widgets/custom_paint/bottom_upper_left_diagonal.dart';
import 'package:spacha_maker/ui/widgets/custom_paint/bottom_upper_right_diagonal.dart';
import 'package:spacha_maker/ui/widgets/custom_paint/upper_left_diagonal_line.dart';
import 'package:spacha_maker/ui/widgets/custom_paint/upper_right_diagonal_line.dart';

Widget spachaEnvelope({
  required BuildContext context,
  required String name,
  required int price,
  required String message,
  required bool isCorner,
  File? iconImage,
}) {
  Color widgetLightColor() {
    if (200 <= price && price <= 499) {
      return spachaLightCyan;
    } else if (500 <= price && price <= 999) {
      return spachaLightGreen;
    } else if (1000 <= price && price <= 1999) {
      return spachaLightYellow;
    } else if (2000 <= price && price <= 4999) {
      return spachaLightOrange;
    } else if (5000 <= price && price <= 9999) {
      return spachaLightMagenta;
    } else if (10000 <= price) {
      return spachaLightRed;
    }
    return spachaBlue;
  }

  final width = MediaQuery.of(context).size.width - 16;
  final height = width / sqrt(2); //基準

  return Padding(
    padding: const EdgeInsets.all(8),
    child: AspectRatio(
      aspectRatio: sqrt(2) / 1, // 横/縦
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: widgetLightColor(),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: height * (sqrt(2) / 4),
                  width: (width / 4) - 0.5,
                  child: CustomPaint(
                    painter: UpperLeftDiagonalLine(),
                  ),
                ),
                Container(
                  height: height * (sqrt(2) / 4),
                  width: (width / 4) - 0.5,
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(width: 0.7),
                      right: BorderSide(width: 0.7),
                    ),
                  ),
                  child: CustomPaint(
                    painter: UpperRightDiagonalLine(),
                  ),
                ),
                Container(
                  height: height * (sqrt(2) / 4),
                  width: (width / 4) - 0.5,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 0.7),
                    ),
                  ),
                  child: CustomPaint(
                    painter: UpperLeftDiagonalLine(),
                  ),
                ),
                SizedBox(
                  height: height * (sqrt(2) / 4),
                  width: (width / 4) - 0.5,
                  child: CustomPaint(
                    painter: UpperRightDiagonalLine(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: height / 6 * (4 - sqrt(2)) - 2,
                  width: width / 4,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 0.7),
                      top: BorderSide(width: 0.7),
                    ),
                  ),
                ),
                Container(
                  height: height / 6 * (4 - sqrt(2)) - 2,
                  width: (width / 2) - 2,
                  color: black,

                  ///TODO スパチャの画像を入れる
                ),
                Container(
                  height: height / 6 * (4 - sqrt(2)) - 2,
                  width: width / 4,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 0.7),
                      top: BorderSide(width: 0.7),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: height / 12 * (4 - sqrt(2)),
                  width: (width / 4) - 0.5,
                  child: CustomPaint(
                    painter: BottomUpperLeftDiagonal(),
                  ),
                ),
                Container(
                  height: height / 12 * (4 - sqrt(2)),
                  width: (width / 4) - 0.5,
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(width: 0.7),
                      right: BorderSide(width: 0.7),
                    ),
                  ),
                  child: CustomPaint(
                    painter: BottomUpperRightDiagonal(),
                  ),
                ),
                Container(
                  height: height / 12 * (4 - sqrt(2)),
                  width: (width / 4) - 0.5,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 0.7),
                    ),
                  ),
                  child: CustomPaint(
                    painter: BottomUpperLeftDiagonal(),
                  ),
                ),
                SizedBox(
                  height: height / 12 * (4 - sqrt(2)),
                  width: (width / 4) - 0.5,
                  child: CustomPaint(
                    painter: BottomUpperRightDiagonal(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
