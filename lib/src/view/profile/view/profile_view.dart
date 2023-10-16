/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:mazarbul/mazarbul.dart';
import 'package:squadsplitter/src/core/components/app_spacing.dart';
import 'package:squadsplitter/src/product/enum/mazarbul_key_enum.dart';
import 'package:squadsplitter/src/product/extension/padding_extension_symetric.dart';
import '../view_model/profile_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ProfileViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: ListView(
          padding: context.horizontalPadding,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                child: Hero(
                  tag: MazarbulKeyEnum.profilePicture,
                  child: CircleAvatar(
                    backgroundImage: Mazarbul.instance.getString(MazarbulKeyEnum.profilePicture) == null
                        ? null
                        : MemoryImage(base64.decode(Mazarbul.instance.getString(MazarbulKeyEnum.profilePicture)!)),
                  ),
                ),
              ),
            ),
            const AppSpacing(),
            const AppSpacing(),
            Card(
              child: ListTile(
                title: const Text("Profilini Düzenle"),
                trailing: IconButton(onPressed: () => pushProfileUpdate(context), icon: const Icon(Icons.edit)),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(Mazarbul.instance.getString(MazarbulKeyEnum.name) ?? "Nameless"),
                leading: const Icon(Icons.person),
              ),
            ),
            Card(
              child: ListTile(
                title: Text((Mazarbul.instance.getString(MazarbulKeyEnum.nickname) ?? "nameless").split("-").first),
                leading: const Icon(Icons.gamepad),
              ),
            ),
            const Divider(),
          ],
        ));
  }
}
