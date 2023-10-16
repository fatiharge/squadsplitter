/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// BaseStateModel: This is a fundamental class created for use in Flutter applications.
/// This class manages the state of a Widget and provides basic functionalities.
abstract class BaseStateModel<T extends StatefulWidget> extends State<T> {
  /// Indicates the loading state of the application. The default value is false.
  bool isLoading = false;

  /// Indicates whether there is an error. The default value is false.
  bool isError = false;

  /// If an error occurs, it is stored here.
  Exception? exception;

  /// Used to redraw the State.
  void setState_() {
    setState(() {});
  }

  /// Changes the isLoading variable.
  /// If the loading parameter is set to true, a loading indicator is displayed.
  void changeLoading({bool? value, bool? loading}) {
    if (loading ?? false) {
      if (isLoading) {
        EasyLoading.dismiss();
      } else {
        EasyLoading.show();
      }
    }

    setState(() {
      isLoading = value ?? !isLoading;
    });
  }

  /// Initiates an operation and changes the loading state when starting and finishing the operation.
  /// The func parameter is a function that performs the operation.
  Future<void> syncProcessUi({required Function func, bool? value, bool loading = false}) async {
    changeLoading(loading: loading, value: true);
    await func();
    changeLoading(loading: loading, value: value);
  }
}
