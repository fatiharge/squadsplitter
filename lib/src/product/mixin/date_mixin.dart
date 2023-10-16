/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

mixin DateMixin {
  String? calculateDate(String? string) {
    if (string == null) {
      return "2023";
    }
    //ISO 8601
    String patern =
        r'[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}(\.[0-9]+)?([Zz]|([\+-])([01]\d|2[0-3]):?([0-5]\d)?)?';
    RegExp regExp = RegExp(patern);
    if (!regExp.hasMatch(string)) {
      return "2023";
    } else {
      List<String> lst = string.split("T")[0].split("-");
      return "${lst[2]}/${lst[1]}/${lst[0]}";
    }
  }
}
