/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:squadsplitter/src/core/components/app_spacing.dart';
import 'package:squadsplitter/src/product/enum/lottie_paths.dart';
import 'package:squadsplitter/src/product/extension/lottie_paths_enum.dart';
import 'package:squadsplitter/src/product/extension/padding_extension_symetric.dart';
import 'package:squadsplitter/src/product/model/hive/team_model.dart';
import 'package:squadsplitter/src/product/widget/profile_image.dart';
import 'package:squadsplitter/src/view/create_team/view/create_team_view.dart';
import 'package:squadsplitter/src/view/home/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  bool editableMood = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Squad Splitter"),
        actions: const [
          ProfileImage(),
          AppSpacing.vertical(),
        ],
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.add),
        ),
        type: ExpandableFabType.up,
        distance: 50,
        children: [
          Row(
            children: [
              const Text("Yeni Takım Oluştur"),
              const AppSpacing.vertical(),
              FloatingActionButton.small(
                heroTag: null,
                child: const Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateTeamView(),
                  ));
                },
              ),
            ],
          ),
          Row(
            children: [
              editableMood ? Text("Düzenleme Modunu Kapat") : Text("Düzenleme Modunu Aç"),
              const AppSpacing.vertical(),
              FloatingActionButton.small(
                heroTag: null,
                child: const Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    editableMood = !editableMood;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              const Text("Online Takım Oluştur"),
              const AppSpacing.vertical(),
              FloatingActionButton.small(
                heroTag: null,
                child: const Icon(Icons.online_prediction),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<TeamModel>(TeamModel.name).listenable(),
        builder: (BuildContext context, Box<TeamModel> box, Widget? child) {
          return box.values.isEmpty
              ? Lottie.asset(LottiePaths.empty.lottiePath())
              : ListView(
                  padding: context.horizontalPadding,
                  children: box.values
                      .map(
                        (TeamModel tm) => Card(
                          child: ListTile(
                            title: Text(tm.gameName),
                            trailing: editableMood
                                ? IconButton(
                                    onPressed: () {
                                      box.delete(tm.gameName);
                                    },
                                    icon: Icon(Icons.delete))
                                : null,
                          ),
                        ),
                      )
                      .toList(),
                );
        },
      ),
    );
  }
}
