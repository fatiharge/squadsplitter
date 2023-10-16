/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/material.dart';

extension DurationExtension on BuildContext {
  Duration get minDuration => const Duration(milliseconds: 200);

  Duration get lowDuration => const Duration(milliseconds: 500);

  Duration get normalDuration => const Duration(seconds: 1);

  Duration get bigDuration => const Duration(seconds: 2);
}
