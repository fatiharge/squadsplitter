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

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:nimphelos/model/nimphelos_model.dart';
import 'package:nimphelos/nimphelos.dart';

abstract class IChartService {
  Future<Map<String, dynamic>?> getArticle(
      {required String password, required String nickName, required BuildContext context});
}

class ChartService extends IChartService {
  final nimphelos = Nimphelos();

  @override
  Future<Map<String, dynamic>?> getArticle(
      {required String password, required String nickName, required BuildContext context}) async {
    NimphelosModel res = await nimphelos.fetchData<Map<String, dynamic>>(
      response: () async {
        return (await Dio().post("add_user_service", data: {"nickName": nickName, "password": password})).data;
      },
      activeAlert: true,
    );

    return res.object;
  }
}
