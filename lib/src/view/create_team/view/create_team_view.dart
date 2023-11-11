/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mazarbul/mazarbul.dart';
import 'package:squadsplitter/src/core/components/app_spacing.dart';
import 'package:squadsplitter/src/core/core_mixin/validate_mixin.dart';
import 'package:squadsplitter/src/product/enum/lottie_paths.dart';
import 'package:squadsplitter/src/product/extension/padding_extension_symetric.dart';
import 'package:squadsplitter/src/product/model/hive/game_model.dart';
import 'package:squadsplitter/src/product/model/hive/team_model.dart';
import 'package:squadsplitter/src/view/create_game/view/create_game_view.dart';
import 'package:squadsplitter/src/product/extension/lottie_paths_enum.dart';
import '../../../product/enum/mazarbul_key_enum.dart';
import '../view_model/create_team_view_model.dart';
import 'package:lottie/lottie.dart';

class CreateTeamView extends StatefulWidget {
  const CreateTeamView({Key? key}) : super(key: key);

  @override
  State<CreateTeamView> createState() => _CreateTeamViewState();
}

class _CreateTeamViewState extends CreateTeamViewModel with ValidateMixin {
  Map<String, int> selectedList = {};
  TextEditingController countController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GameModel? selectedGame;
  final GlobalKey<FormState> formKey = GlobalKey();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Takım Oluştur"),
      ),
      body: Padding(
        padding: context.horizontalPadding,
        child: Column(
          children: [
            Expanded(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Stepper(
                  currentStep: _index,
                  onStepCancel: () {
                    if (_index > 0) {
                      setState(() {
                        _index -= 1;
                      });
                    }
                  },
                  onStepContinue: () {
                    if (_index < 3) {
                      setState(() {
                        _index += 1;
                      });
                    }
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      _index = index;
                    });
                  },
                  steps: <Step>[
                    Step(
                      title: const Text("Oyun tipini Belirleyin"),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ValueListenableBuilder(
                              valueListenable: Hive.box<GameModel>(GameModel.name).listenable(),
                              builder: (BuildContext context, Box<GameModel> box, Widget? child) {
                                return box.values.isEmpty
                                    ? Lottie.asset(LottiePaths.empty.lottiePath())
                                    : Column(
                                        children: box.values
                                            .map(
                                              (GameModel gm) => RadioListTile(
                                                title: Text(gm.gameName),
                                                value: selectedGame,
                                                groupValue: gm,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedGame = gm;
                                                  });
                                                },
                                              ),
                                            )
                                            .toList(),
                                      );
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const CreateGameView(),
                                ));
                              },
                              child: const Text("Yeni Oyun Ekle"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Step(
                      title: const Text("Zorunlu Oyuncu Tipini belirleyin"),
                      content: selectedGame == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Lütfen Oyunu Seçin"),
                                Lottie.asset(LottiePaths.empty.lottiePath()),
                              ],
                            )
                          : Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: selectedGame!.playerType
                                    .map(
                                      (String str) => CheckboxListTile(
                                        title: Text(str),
                                        subtitle: Row(
                                          children: [
                                            IconButton(
                                                onPressed: selectedList.containsKey(str)
                                                    ? selectedList[str] != 1
                                                        ? () {
                                                            setState(() {
                                                              selectedList[str] = selectedList[str]! - 1;
                                                            });
                                                          }
                                                        : () {
                                                            setState(() {
                                                              selectedList.remove(str);
                                                            });
                                                          }
                                                    : null,
                                                icon: const Icon(Icons.remove)),
                                            Text(selectedList.containsKey(str)
                                                ? selectedList[str].toString()
                                                : 0.toString()),
                                            IconButton(
                                                onPressed: selectedList.containsKey(str)
                                                    ? () {
                                                        setState(() {
                                                          selectedList[str] = selectedList[str]! + 1;
                                                        });
                                                      }
                                                    : null,
                                                icon: const Icon(Icons.add)),
                                          ],
                                        ),
                                        value: selectedList.containsKey(str),
                                        onChanged: (value) {
                                          setState(() {
                                            if (value ?? false) {
                                              selectedList.addAll({str: 1});
                                            } else {
                                              selectedList.remove(str);
                                            }
                                          });
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                    ),
                    Step(
                      title: const Text("Takım Sayısını Belirlerleyin"),
                      content: TextFormField(
                        controller: countController,
                        keyboardType: TextInputType.number,
                        validator: checkPleaseValidator(isNotEmpty, "Bu alan boş olamaz"),
                      ),
                    ),
                    Step(
                      title: const Text("Takımın adını Belirlerleyin"),
                      content: TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        validator: checkPleaseValidator(isNotEmpty, "Bu alan boş olamaz"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if ((formKey.currentState?.validate() ?? false) && selectedGame?.gameName != null) {
                  Hive.box<TeamModel>(TeamModel.name).put(
                    nameController.value.text,
                    TeamModel(
                        gameName: nameController.value.text,
                        teamCount: int.tryParse(countController.value.text) ?? 10,
                        createdPlayer: Mazarbul.instance.getString(MazarbulKeyEnum.nickname) ?? "nameless",
                        playerType: selectedList,
                        gameType: selectedGame!.gameName),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Center(
                child: Text("Takımı Ekle"),
              ),
            ),
            const AppSpacing(),
            const AppSpacing(),
          ],
        ),
      ),
    );
  }
}
