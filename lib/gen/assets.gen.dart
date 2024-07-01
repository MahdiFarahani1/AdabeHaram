/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsDatabaseGen {
  const $AssetsDatabaseGen();

  /// File path: assets/database/db.sqlite
  String get db => 'assets/database/db.sqlite';

  /// List of all assets
  List<String> get values => [db];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/adab-icon-01.png
  AssetGenImage get adabIcon01 =>
      const AssetGenImage('assets/images/adab-icon-01.png');

  /// File path: assets/images/adab-icon-02.png
  AssetGenImage get adabIcon02 =>
      const AssetGenImage('assets/images/adab-icon-02.png');

  /// File path: assets/images/adab-icon-03.png
  AssetGenImage get adabIcon03 =>
      const AssetGenImage('assets/images/adab-icon-03.png');

  /// File path: assets/images/adab-icon-04.png
  AssetGenImage get adabIcon04 =>
      const AssetGenImage('assets/images/adab-icon-04.png');

  /// File path: assets/images/adab-icon-05.png
  AssetGenImage get adabIcon05 =>
      const AssetGenImage('assets/images/adab-icon-05.png');

  /// File path: assets/images/adab-icon-06.png
  AssetGenImage get adabIcon06 =>
      const AssetGenImage('assets/images/adab-icon-06.png');

  /// File path: assets/images/adab-icon-07.png
  AssetGenImage get adabIcon07 =>
      const AssetGenImage('assets/images/adab-icon-07.png');

  /// File path: assets/images/adab-icon-08.png
  AssetGenImage get adabIcon08 =>
      const AssetGenImage('assets/images/adab-icon-08.png');

  /// File path: assets/images/app_icon.png
  AssetGenImage get appIcon =>
      const AssetGenImage('assets/images/app_icon.png');

  /// File path: assets/images/div.png
  AssetGenImage get div => const AssetGenImage('assets/images/div.png');

  /// File path: assets/images/header.jpg
  AssetGenImage get header => const AssetGenImage('assets/images/header.jpg');

  /// File path: assets/images/kh.jpg
  AssetGenImage get kh => const AssetGenImage('assets/images/kh.jpg');

  /// File path: assets/images/m.jpg
  AssetGenImage get m => const AssetGenImage('assets/images/m.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        adabIcon01,
        adabIcon02,
        adabIcon03,
        adabIcon04,
        adabIcon05,
        adabIcon06,
        adabIcon07,
        adabIcon08,
        appIcon,
        div,
        header,
        kh,
        m
      ];
}

class Assets {
  Assets._();

  static const $AssetsDatabaseGen database = $AssetsDatabaseGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
