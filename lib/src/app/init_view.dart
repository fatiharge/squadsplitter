/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/material.dart';
import 'package:squadsplitter/src/app/init_view_model.dart';

class InitializationView extends StatefulWidget {
  const InitializationView({Key? key, required this.widget}) : super(key: key);
  final Widget widget;

  @override
  State<InitializationView> createState() => _InitializationViewState();
}

class _InitializationViewState extends InitializationViewModel {
  @override
  Widget build(BuildContext context) {
    return initCompleted
        ? widget.widget
        : const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
