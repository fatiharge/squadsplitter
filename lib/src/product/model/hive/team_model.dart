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

/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:hive_flutter/hive_flutter.dart';

part 'team_model.g.dart';

@HiveType(typeId: 2)
class TeamModel {
  TeamModel({
    required this.gameName,
    required this.teamCount,
    required this.createdPlayer,
    required this.playerType,
    required this.gameType,
  });

  @HiveField(0)
  String gameName;

  @HiveField(1)
  int teamCount;

  @HiveField(2)
  String createdPlayer;

  @HiveField(3)
  List<String> playerType;

  @HiveField(5)
  String gameType;


  static const String name = "TeamModelVer1";
}
