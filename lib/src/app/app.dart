/*
 * Copyright (c) 2023. fatiharge
 *
 * You are free to copy, modify, and redistribute this software, but you must abide by these terms when distributing any derivative works under the project's license.
 *
 * Author : Fatih Çetin
 * Mail   : fatih@fatiharge.com
 */

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:squadsplitter/src/app/init_view.dart';
import 'package:squadsplitter/src/product/enum/language_code_enum.dart';
import 'package:squadsplitter/src/product/theme/dark_theme.dart';
import 'package:squadsplitter/src/product/theme/light_theme.dart';
import 'package:squadsplitter/src/product/theme/theme_manager.dart';
import 'package:squadsplitter/src/view/home/view/home_view.dart';
import '../product/mixin/toast_mixin.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with ToastMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeManager.instance,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Squad Splitter",
          restorationScopeId: "app",
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale(LanguageCode.en.name, LanguageCode.en.name.toUpperCase()),
            Locale(LanguageCode.tr.name, LanguageCode.tr.name.toUpperCase()),
          ],
          onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,
          theme: LightTheme(context).theme,
          darkTheme: DarkTheme(context).theme,
          themeMode: ThemeManager.instance.themeMode,
          home: const InitializationView(widget: HomeView()),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
