/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/material.dart';
import 'package:squadsplitter/src/core/base_model/base_state_model.dart';
import 'package:squadsplitter/src/view/profile_update_view/view/profile_update_view.dart';

import '../view/profile_view.dart';

abstract class ProfileViewModel extends BaseStateModel<ProfileView> {
  void pushProfileUpdate(BuildContext context) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(builder: (context) => const ProfileUpdateView()),
        )
        .then((value) => setState(() {}));
  }
}
