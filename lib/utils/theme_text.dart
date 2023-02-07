import 'package:flutter/material.dart';

// https://material.io/design/typography/the-type-system.html#type-scale

TextTheme _getTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

class Headline1Text extends StatelessWidget {
  const Headline1Text(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 0,
  });

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).displayLarge?.copyWith(color: color),
      ),
    );
  }
}

class Headline2Text extends StatelessWidget {
  const Headline2Text(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 0,
  });

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).displayMedium?.copyWith(color: color),
      ),
    );
  }
}

class Headline3Text extends StatelessWidget {
  const Headline3Text(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 0,
  });

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).displaySmall?.copyWith(color: color),
      ),
    );
  }
}

class Headline4Text extends StatelessWidget {
  const Headline4Text(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 0,
  });

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).headlineMedium?.copyWith(color: color),
      ),
    );
  }
}

class Headline5Text extends StatelessWidget {
  const Headline5Text(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 0,
  });

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).headlineSmall?.copyWith(color: color),
      ),
    );
  }
}

class Headline6Text extends StatelessWidget {
  const Headline6Text(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 0,
  });

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).titleLarge?.copyWith(color: color),
      ),
    );
  }
}

class Subtitle1Text extends StatelessWidget {
  const Subtitle1Text(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 0,
  });

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).titleMedium?.copyWith(color: color),
      ),
    );
  }
}

class Subtitle2Text extends StatelessWidget {
  const Subtitle2Text(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 0,
  });

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).titleSmall?.copyWith(color: color),
      ),
    );
  }
}

class BodyText1Text extends StatelessWidget {
  const BodyText1Text(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 0,
  });

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).bodyLarge?.copyWith(color: color),
      ),
    );
  }
}

class BodyText2Text extends StatelessWidget {
  const BodyText2Text(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 0,
  });

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).bodyMedium?.copyWith(color: color),
      ),
    );
  }
}

class CaptionText extends StatelessWidget {
  const CaptionText(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 0,
  });

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: _getTheme(context).bodySmall?.copyWith(color: color),
      ),
    );
  }
}

class OverlineText extends StatelessWidget {
  const OverlineText(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 0,
  });

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        style: _getTheme(context).labelSmall?.copyWith(color: color),
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.bottomPadding = 0,
  });

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: _getTheme(context).labelLarge?.copyWith(color: color),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    this.fontSize,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.fontWeight,
    this.height,
    this.letterSpacing,
    this.wordSpacing,
    this.decoration,
    this.bottomPadding = 0,
  });

  final String? text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextDecoration? decoration;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        text ?? '',
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          decoration: decoration,
        ),
      ),
    );
  }
}
