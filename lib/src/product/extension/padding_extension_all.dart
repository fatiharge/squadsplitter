/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/material.dart';
import 'package:squadsplitter/src/product/extension/context_extension.dart';

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingMin => EdgeInsets.all(minValue);

  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);

  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);

  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);

  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}
