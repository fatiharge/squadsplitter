/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mazarbul/mazarbul.dart';
import 'package:squadsplitter/src/core/core_mixin/validate_mixin.dart';
import 'package:squadsplitter/src/product/extension/context_extension.dart';
import 'package:squadsplitter/src/product/extension/padding_extension_symetric.dart';
import 'package:squadsplitter/src/product/mixin/toast_mixin.dart';

import '../../../core/components/app_spacing.dart';
import '../../../product/enum/mazarbul_key_enum.dart';
import '../view_model/profile_update_view_model.dart';

class ProfileUpdateView extends StatefulWidget {
  const ProfileUpdateView({Key? key}) : super(key: key);

  @override
  State<ProfileUpdateView> createState() => _ProfileUpdateViewState();
}

class _ProfileUpdateViewState extends ProfileUpdateViewModel with ValidateMixin, ToastMixin {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController nickNameTextEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isEditable = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameTextEditingController.text = Mazarbul.instance.getString(MazarbulKeyEnum.name) ?? "Nameless";
    nickNameTextEditingController.text =
        (Mazarbul.instance.getString(MazarbulKeyEnum.nickname) ?? "nameless").split("-").first;

    if (Mazarbul.instance.getString(MazarbulKeyEnum.nickname) == "nameless" ||
        Mazarbul.instance.getString(MazarbulKeyEnum.nickname) == null) {
      isEditable = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: ListView(
        padding: context.horizontalPadding,
        children: [
          Row(
            children: [
              Hero(
                tag: MazarbulKeyEnum.profilePicture,
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Mazarbul.instance.getString(MazarbulKeyEnum.profilePicture) == null
                      ? Container(
                          color: context.colors.primaryContainer,
                        )
                      : Image.memory(
                          base64.decode(Mazarbul.instance.getString(MazarbulKeyEnum.profilePicture)!),
                        ),
                ),
              ),
              const AppSpacing.vertical(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Mazarbul.instance.removeItem(MazarbulKeyEnum.profilePicture).then((value) => setState(() {}));
                    },
                    child: const Text("Profil Resmini Sil"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image = await picker.pickImage(
                        source: ImageSource.camera,
                        maxHeight: 240,
                        maxWidth: 240,
                      );

                      if (image != null) {
                        image.readAsBytes().then((value) {
                          Mazarbul.instance.saveString(MazarbulKeyEnum.profilePicture, base64.encode(value));
                          setState(() {});
                        });
                      }
                    },
                    child: const Text("Kamera ile Güncelle"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image = await picker.pickImage(
                        source: ImageSource.gallery,
                        maxHeight: 240,
                        maxWidth: 240,
                      );

                      if (image != null) {
                        image.readAsBytes().then((value) {
                          Mazarbul.instance.saveString(MazarbulKeyEnum.profilePicture, base64.encode(value));
                          setState(() {});
                        });
                      }
                    },
                    child: const Text("Galerinden Güncelle"),
                  ),
                ],
              ),
            ],
          ),
          const AppSpacing(),
          const Divider(),
          const AppSpacing(),
          Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              Card(
                child: ListTile(
                  title: TextFormField(
                    controller: nameTextEditingController,
                    validator: checkPleaseValidator(isNotEmpty, "Bu alan boş olamaz"),
                  ),
                  leading: const Icon(Icons.person),
                ),
              ),
              Card(
                child: ListTile(
                  title: isEditable
                      ? TextFormField(
                          controller: nickNameTextEditingController,
                          validator: checkPleaseValidator(validateNickname, "Bu alan boş olamaz"),
                        )
                      : Text(Mazarbul.instance.getString(MazarbulKeyEnum.nickname) ?? ""),
                  leading: const Icon(Icons.gamepad),
                ),
              ),
            ]),
          ),
          const Text("* Nickname Alanını yalnızca bir kez değiştirebilirsiniz"),
          const Divider(),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                Mazarbul.instance.saveString(MazarbulKeyEnum.name, nameTextEditingController.value.text);
                if (isEditable) {
                  Mazarbul.instance.saveString(MazarbulKeyEnum.nickname,
                      "${nickNameTextEditingController.value.text}-${generateRandom5DigitNumber()}");
                }

                Navigator.pop(context);
              } else {
                showToast("Alanları Kontrol ediniz", context);
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  int generateRandom5DigitNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(90000) + 10000; // 10,000 - 99,999 arası rastgele sayı üretir
    return randomNumber;
  }
}
