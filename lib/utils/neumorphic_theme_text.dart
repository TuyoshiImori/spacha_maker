import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:spacha_maker/themes/app_colors.dart';

class NeumorphicBodyText extends StatelessWidget {
  const NeumorphicBodyText(
    this.text, {
    super.key,
    this.color = textPrimary,
    this.depth = 4,
    this.bottomPadding = 0,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0,
  });

  final String? text;
  final Color color;
  final double depth;
  final double bottomPadding;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: NeumorphicText(
        text ?? '',
        style: NeumorphicStyle(
          depth: depth,
          color: color,
        ),
        textStyle: NeumorphicTextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }
}
