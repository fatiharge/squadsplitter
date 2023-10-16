/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/material.dart';
import 'color_schemes.dart';

class LightTheme {
  late ThemeData theme;

  LightTheme(BuildContext c) {
    theme = ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
    );
  }
}
