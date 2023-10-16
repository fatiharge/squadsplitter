/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/material.dart';

// https://m2.material.io/design/layout/spacing-methods.html

class AppSpacing extends SizedBox {
  const AppSpacing({Key? key, double? height}) : super(key: key, height: height ?? 8);

  const AppSpacing.vertical({Key? key, double? width}) : super(key: key, width: width ?? 8);
}
