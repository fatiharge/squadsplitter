/*
 *
 *  * Copyright (c) 2023. fatiharge
 *  *
 *  * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *  *
 *  * Author : Fatih Çetin
 *  * Mail   : fatih@fatiharge.com
 *
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mazarbul/mazarbul.dart';
import 'package:squadsplitter/src/product/enum/mazarbul_key_enum.dart';
import 'package:squadsplitter/src/product/extension/padding_extension_all.dart';
import 'package:squadsplitter/src/product/extension/padding_extension_symetric.dart';
import 'package:squadsplitter/src/view/profile/view/profile_view.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPadding,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileView())).then((value) {
            setState(() {});
          });
        },
        child: Padding(
          padding: context.paddingMin,
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
    );
  }
}
