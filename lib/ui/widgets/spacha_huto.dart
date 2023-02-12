import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spacha_maker/themes/app_colors.dart';
import 'package:spacha_maker/ui/widgets/custom_paint/bottom_upper_left_diagonal.dart';
import 'package:spacha_maker/ui/widgets/custom_paint/bottom_upper_right_diagonal.dart';
import 'package:spacha_maker/ui/widgets/custom_paint/upper_left_diagonal_line.dart';
import 'package:spacha_maker/ui/widgets/custom_paint/upper_right_diagonal_line.dart';

Widget spachaHuto({
  required BuildContext context,
  required int price,
  required Uint8List spachaWidget,
  required bool isSaving,
}) {
  Color widgetLightColor() {
    if (isSaving) {
      return white;
    }
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

  final height = MediaQuery.of(context).size.width - 16;
  final width = height / sqrt(2); //基準

  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: widgetLightColor(),
    ),
    child: Row(
      children: [
        Column(
          children: [
            Container(
              width: width / 12 * (4 - sqrt(2)),
              height: (height / 4) - 0.5,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(width: 0.7),
                ),
              ),
              child: CustomPaint(
                painter: BottomUpperLeftDiagonal(),
              ),
            ),
            Container(
              width: width / 12 * (4 - sqrt(2)),
              height: (height / 4) - 0.5,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.7),
                  bottom: BorderSide(width: 0.7),
                  right: BorderSide(width: 0.7),
                ),
              ),
              child: CustomPaint(
                painter: BottomUpperRightDiagonal(),
              ),
            ),
            Container(
              width: width / 12 * (4 - sqrt(2)),
              height: (height / 4) - 0.5,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.7),
                  right: BorderSide(width: 0.7),
                ),
              ),
              child: CustomPaint(
                painter: BottomUpperLeftDiagonal(),
              ),
            ),
            Container(
              width: width / 12 * (4 - sqrt(2)),
              height: (height / 4) - 0.5,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(width: 0.7),
                ),
              ),
              child: CustomPaint(
                painter: BottomUpperRightDiagonal(),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: width / 6 * (4 - sqrt(2)) - 2,
              height: height / 4,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.7),
                ),
              ),
            ),
            Container(
              width: width / 6 * (4 - sqrt(2)) - 2,
              height: (height / 2) - 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: MemoryImage(spachaWidget),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: width / 6 * (4 - sqrt(2)) - 2,
              height: height / 4,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.7),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: width * (sqrt(2) / 4),
              height: (height / 4) - 0.5,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(width: 0.7),
                ),
              ),
              child: CustomPaint(
                painter: UpperLeftDiagonalLine(),
              ),
            ),
            Container(
              width: width * (sqrt(2) / 4),
              height: (height / 4) - 0.5,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.7),
                  bottom: BorderSide(width: 0.7),
                ),
              ),
              child: CustomPaint(
                painter: UpperRightDiagonalLine(),
              ),
            ),
            Container(
              width: width * (sqrt(2) / 4),
              height: (height / 4) - 0.5,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.7),
                ),
              ),
              child: CustomPaint(
                painter: UpperLeftDiagonalLine(),
              ),
            ),
            Container(
              width: width * (sqrt(2) / 4),
              height: (height / 4) - 0.5,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(width: 0.7),
                ),
              ),
              child: CustomPaint(
                painter: UpperRightDiagonalLine(),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
