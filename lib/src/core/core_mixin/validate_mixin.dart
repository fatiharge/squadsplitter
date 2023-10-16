/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

/// A mixin providing validation functions commonly used in form fields.
mixin ValidateMixin {
  /// Combines a custom validation function with a specific error message.
  String? Function(String?) checkPleaseValidator(String? Function(String? data) func, String? text) {
    return (text == null) ? func : (String? data) => func(data) == null ? null : text;
  }

  /// Checks if a string is not empty.
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : "Please check";
  }

  /// Validates a mobile phone number.
  String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return "Check your number";
    } else {
      return null;
    }
  }

  /// Validates a location format in the form of latitude,longitude.
  String? validateLocation(String value) {
    String pattern = r'(^([-+]?\d{1,2}[.]\d+),\s*([-+]?\d{1,3}[.]\d+)$)';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return "This is not a location format";
    } else {
      return null;
    }
  }

  String? validateNickname(String? value) {
    String pattern = r'[^a-z]';
    RegExp regExp = RegExp(pattern);

    if (regExp.hasMatch(value ?? "ERROR") || (value?.isEmpty ?? false)) {
      return "This is not a nickname format";
    } else {
      return null;
    }
  }
}
