/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/balloning.png
  AssetGenImage get balloning =>
      const AssetGenImage('assets/images/balloning.png');

  /// File path: assets/images/button-one.png
  AssetGenImage get buttonOne =>
      const AssetGenImage('assets/images/button-one.png');

  /// File path: assets/images/hiking.png
  AssetGenImage get hiking => const AssetGenImage('assets/images/hiking.png');

  /// File path: assets/images/kayaking.png
  AssetGenImage get kayaking =>
      const AssetGenImage('assets/images/kayaking.png');

  /// File path: assets/images/mountain.jpeg
  AssetGenImage get mountain =>
      const AssetGenImage('assets/images/mountain.jpeg');

  /// File path: assets/images/snorkling.png
  AssetGenImage get snorkling =>
      const AssetGenImage('assets/images/snorkling.png');

  /// File path: assets/images/welcome-one.png
  AssetGenImage get welcomeOne =>
      const AssetGenImage('assets/images/welcome-one.png');

  /// File path: assets/images/welcome-three.png
  AssetGenImage get welcomeThree =>
      const AssetGenImage('assets/images/welcome-three.png');

  /// File path: assets/images/welcome-two.png
  AssetGenImage get welcomeTwo =>
      const AssetGenImage('assets/images/welcome-two.png');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
