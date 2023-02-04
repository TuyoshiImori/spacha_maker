/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/NotoSansJP-Bold.otf
  String get notoSansJPBold => 'assets/fonts/NotoSansJP-Bold.otf';

  /// File path: assets/fonts/NotoSansJP-Regular.otf
  String get notoSansJPRegular => 'assets/fonts/NotoSansJP-Regular.otf';

  /// List of all assets
  List<String> get values => [notoSansJPBold, notoSansJPRegular];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_blue_icon.jpg
  AssetGenImage get appBlueIcon =>
      const AssetGenImage('assets/images/app_blue_icon.jpg');

  /// File path: assets/images/app_cyan_icon.jpg
  AssetGenImage get appCyanIcon =>
      const AssetGenImage('assets/images/app_cyan_icon.jpg');

  /// File path: assets/images/app_green_icon.jpg
  AssetGenImage get appGreenIcon =>
      const AssetGenImage('assets/images/app_green_icon.jpg');

  /// File path: assets/images/app_magenta_icon.jpg
  AssetGenImage get appMagentaIcon =>
      const AssetGenImage('assets/images/app_magenta_icon.jpg');

  /// File path: assets/images/app_orange_icon.jpg
  AssetGenImage get appOrangeIcon =>
      const AssetGenImage('assets/images/app_orange_icon.jpg');

  /// File path: assets/images/app_red_icon.jpg
  AssetGenImage get appRedIcon =>
      const AssetGenImage('assets/images/app_red_icon.jpg');

  /// File path: assets/images/app_yellow_icon.jpg
  AssetGenImage get appYellowIcon =>
      const AssetGenImage('assets/images/app_yellow_icon.jpg');

  /// File path: assets/images/introduction_envelope.jpg
  AssetGenImage get introductionEnvelope =>
      const AssetGenImage('assets/images/introduction_envelope.jpg');

  /// File path: assets/images/introduction_spacha.jpg
  AssetGenImage get introductionSpacha =>
      const AssetGenImage('assets/images/introduction_spacha.jpg');

  /// File path: assets/images/pdf_file.png
  AssetGenImage get pdfFile =>
      const AssetGenImage('assets/images/pdf_file.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        appBlueIcon,
        appCyanIcon,
        appGreenIcon,
        appMagentaIcon,
        appOrangeIcon,
        appRedIcon,
        appYellowIcon,
        introductionEnvelope,
        introductionSpacha,
        pdfFile
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
