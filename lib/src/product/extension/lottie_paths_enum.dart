/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:squadsplitter/src/product/enum/lottie_paths.dart';

extension LottiePathsExtension on LottiePaths {
  String lottiePath() {
    return 'assets/lottie_json/$name.json';
  }
}
