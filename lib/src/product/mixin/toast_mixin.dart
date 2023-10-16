/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:squadsplitter/src/product/extension/context_extension.dart';
import 'package:squadsplitter/src/product/extension/duration_extension.dart';
import 'package:squadsplitter/src/product/extension/padding_extension_all.dart';

mixin ToastMixin {
  void showToast(String str, BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Card(
      child: Padding(
        padding: context.paddingLow,
        child: Text(
          str,
          style: context.theme.textTheme.bodyMedium,
        ),
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: context.bigDuration,
    );
  }
}
