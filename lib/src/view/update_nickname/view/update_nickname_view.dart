/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/material.dart';
import 'package:squadsplitter/src/core/components/app_spacing.dart';
import 'package:squadsplitter/src/product/extension/padding_extension_symetric.dart';

import '../view_model/update_nickname_model.dart';

class UpdateNicknameView extends StatefulWidget {
  const UpdateNicknameView({Key? key}) : super(key: key);

  @override
  State<UpdateNicknameView> createState() => _UpdateNicknameViewState();
}

class _UpdateNicknameViewState extends UpdateNicknameViewModel {
  TextEditingController nickNameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nick name güncelle"),
      ),
      body: Padding(
        padding: context.horizontalPadding,
        child: Column(
          children: [
            TextFormField(
              controller: nickNameEditingController,
              decoration: InputDecoration(
                hintText: "NickName",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
            ),
            Spacer(),
            ElevatedButton(onPressed: () {}, child: Center(child: Text("Kaydet"))),
            AppSpacing(),
          ],
        ),
      ),
    );
  }
}
