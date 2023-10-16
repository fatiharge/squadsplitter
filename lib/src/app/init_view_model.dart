/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mazarbul/mazarbul.dart';
import 'package:squadsplitter/src/app/init_view.dart';
import 'package:squadsplitter/src/core/base_model/base_state_model.dart';
import 'package:squadsplitter/src/product/model/hive/game_model.dart';
import 'package:squadsplitter/src/product/model/hive/team_model.dart';
import 'package:squadsplitter/src/product/theme/l10_manager.dart';

abstract class InitializationViewModel extends BaseStateModel<InitializationView> {
  bool initCompleted = false;

  @override
  void initState() {
    initEasyLoad();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    initialize();
    super.didChangeDependencies();
  }

  void initEasyLoad() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.light
      ..maskType = EasyLoadingMaskType.black
      ..indicatorType = EasyLoadingIndicatorType.pulse
      ..animationStyle = EasyLoadingAnimationStyle.opacity
      ..userInteractions = false;
  }

  Future<void> initialize() async {
    if (!initCompleted) {
      await Mazarbul().initSp();
      await hiveInitialize();
      Future.microtask(() => L10.startL10(context));
      setState(() {
        initCompleted = true;
      });
    }
  }

  Future<void> hiveInitialize() async {
    await Hive.initFlutter();
    int a = 0;
    Hive.registerAdapter(GameModelAdapter());
    debugPrint("hiveInitialize $a");
    a++;
    Hive.registerAdapter(TeamModelAdapter());
    debugPrint("hiveInitialize $a");
    a++;
    await Hive.openBox<GameModel>(GameModel.name);
    debugPrint("hiveInitialize $a");
    a++;
    await Hive.openBox<TeamModel>(TeamModel.name);
    debugPrint("hiveInitialize $a");
  }
}
