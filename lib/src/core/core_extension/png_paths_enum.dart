/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/material.dart';
import 'package:squadsplitter/src/product/enum/png_paths.dart';

/// An extension providing utility methods for working with image paths related to an enum.
extension PngPathsExtension on PngPaths {
  /// Returns the path of the PNG image associated with the enum value.
  String path() {
    return 'assets/png/$name.png';
  }

  /// Returns an Image widget displaying the PNG image associated with the enum value.
  Widget toWidgetImageAssets({double? height}) {
    return Image.asset(
      path(),
      height: height,
    );
  }

  /// Returns a circular avatar widget displaying the PNG image associated with the enum value.
  Widget toWidgetRoundedImage({double? height}) {
    return CircleAvatar(
      maxRadius: height,
      backgroundImage: AssetImage(path()),
    );
  }

  /// Returns an Image widget with a height of 24 displaying the PNG image associated with the enum value.
  Widget toWidgetImageAssets24() {
    return Image.asset(
      path(),
      height: 24,
    );
  }

  /// Returns an AssetImage object for the PNG image associated with the enum value.
  AssetImage toWidgetAssetsImage() {
    return AssetImage(
      path(),
    );
  }
}
