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

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get horizontalPadding => const EdgeInsets.symmetric(horizontal: 8);

  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);

  EdgeInsets get paddingNormalVertical => EdgeInsets.symmetric(vertical: normalValue);

  EdgeInsets get paddingMediumVertical => EdgeInsets.symmetric(vertical: mediumValue);

  EdgeInsets get paddingHighVertical => EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: lowValue);

  EdgeInsets get paddingNormalHorizontal => EdgeInsets.symmetric(horizontal: normalValue);

  EdgeInsets get paddingMediumHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);

  EdgeInsets get paddingHighHorizontal => EdgeInsets.symmetric(horizontal: highValue);
}
