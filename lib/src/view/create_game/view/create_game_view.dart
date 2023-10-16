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
import 'package:squadsplitter/src/product/enum/mazarbul_key_enum.dart';
import 'package:squadsplitter/src/product/extension/padding_extension_symetric.dart';
import 'package:squadsplitter/src/product/model/hive/game_model.dart';

import '../view_model/create_game_view_model.dart';

class CreateGameView extends StatefulWidget {
  const CreateGameView({Key? key}) : super(key: key);

  @override
  State<CreateGameView> createState() => _CreateGameViewState();
}

class _CreateGameViewState extends CreateGameViewModel with ValidateMixin {
  List<String> playerType = [];
  List<String> playerAbility = [];
  TextEditingController playerTypeController = TextEditingController();
  TextEditingController playerAbilityController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController countController = TextEditingController();
  int _index = 0;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Oyun Oluştur"),
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
                      title: const Text("Oyunun Adını Belirleyin"),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          validator: checkPleaseValidator(isNotEmpty, "Bu alan boş olamaz"),
                        ),
                      ),
                    ),
                    Step(
                      title: const Text("Oyundaki bir takımın içereceği Oyuncu Sayısnı Belirleyin"),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          controller: countController,
                          keyboardType: TextInputType.number,
                          validator: checkPleaseValidator(isNotEmpty, "Bu alan boş olamaz"),
                        ),
                      ),
                    ),
                    Step(
                      title: const Text("Oyuncuların tiplerini ekleyin"),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: playerType.map((String value) => Text("- $value")).toList(),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: playerTypeController,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        if (playerTypeController.value.text.isNotEmpty &&
                                            !playerType.contains(playerTypeController.value.text)) {
                                          playerType.add(playerTypeController.value.text);
                                        }
                                      });
                                    },
                                    child: const Text("Ekle"))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Step(
                      title: const Text("Oyuncuların yeteneklerini ekleyin"),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: playerAbility.map((String value) => Text("- $value")).toList(),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: playerAbilityController,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        if (playerAbilityController.value.text.isNotEmpty &&
                                            !playerAbility.contains(playerAbilityController.value.text)) {
                                          playerAbility.add(playerAbilityController.value.text);
                                        }
                                      });
                                    },
                                    child: const Text("Ekle"))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  Hive.box<GameModel>(GameModel.name).put(
                    nameController.value.text,
                    GameModel(
                      gameName: nameController.value.text,
                      teamCount: int.tryParse(countController.value.text) ?? 10,
                      createdPlayer: Mazarbul.instance.getString(MazarbulKeyEnum.nickname) ?? "nameless",
                      playerType: playerType,
                      playerAbility: playerAbility,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Center(
                child: Text("Oyunu Ekle"),
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
