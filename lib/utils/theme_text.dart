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
    this.bottomPadding = 3,
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
        style: _getTheme(context).headline1?.copyWith(color: color),
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
    this.bottomPadding = 3,
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
        style: _getTheme(context).headline2?.copyWith(color: color),
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
    this.bottomPadding = 3,
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
        style: _getTheme(context).headline3?.copyWith(color: color),
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
    this.bottomPadding = 2,
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
        style: _getTheme(context).headline4?.copyWith(color: color),
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
    this.bottomPadding = 2,
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
        style: _getTheme(context).headline5?.copyWith(color: color),
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
    this.bottomPadding = 2,
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
        style: _getTheme(context).headline6?.copyWith(color: color),
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
    this.bottomPadding = 2,
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
        style: _getTheme(context).subtitle1?.copyWith(color: color),
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
    this.bottomPadding = 2,
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
        style: _getTheme(context).subtitle2?.copyWith(color: color),
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
    this.bottomPadding = 2,
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
        style: _getTheme(context).bodyText1?.copyWith(color: color),
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
    this.bottomPadding = 2,
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
        style: _getTheme(context).bodyText2?.copyWith(color: color),
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
    this.bottomPadding = 2,
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
        style: _getTheme(context).caption?.copyWith(color: color),
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
    this.bottomPadding = 1,
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
        style: _getTheme(context).overline?.copyWith(color: color),
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
    this.bottomPadding = 2,
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
        style: _getTheme(context).button?.copyWith(color: color),
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
    this.bottomPadding = 2,
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
