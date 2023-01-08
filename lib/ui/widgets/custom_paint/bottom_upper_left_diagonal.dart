import 'package:flutter/material.dart';
import 'package:spacha_maker/themes/app_colors.dart';

class BottomUpperLeftDiagonal extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();

    // 三角（外線）
    paint = Paint()
      ..color = black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
    path = Path()
      ..moveTo(size.width, size.height)
      ..lineTo(0, size.height - size.width)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
