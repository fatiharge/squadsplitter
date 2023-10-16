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

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// `L10` is a singleton class that provides easy access to translations
/// from [AppLocalizations].
class L10 {
  static final L10 _instance = L10._();

  L10._();

  factory L10() => _instance;

  /// Initializes the translations with the provided [BuildContext].
  /// This function should be called once at the start of the application.
  ///
  /// Example:
  /// ```dart
  /// void initState() {
  ///    super.initState();
  ///    L10.startL10(context); // Initialize translations
  ///  }
  ///
  ///
  ///
  ///
  /// class MyApp extends StatelessWidget {
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return MaterialApp(
  ///       home: Scaffold(
  ///         appBar: AppBar(
  ///           title: Text(L10.i.appTitle), // Access translation
  ///         ),
  ///         body: Center(
  ///           child: Text(L10.i.welcomeMessage), // Access translation
  ///         ),
  ///       ),
  ///     );
  ///   }
  /// }
  /// ```
  ///
  factory L10.startL10(BuildContext context) {
    _instance._translations = AppLocalizations.of(context)!;
    return _instance;
  }

  AppLocalizations? _translations;

  /// Provides access to the translations.
  ///
  /// Example:
  /// ```dart
  /// Text(
  ///   L10.i.someTranslation, // Access translation
  ///   style: TextStyle(fontSize: 16.0),
  /// )
  /// ```
  static AppLocalizations get i {
    if (_instance._translations == null) {
      throw Exception("Translations not initialized. Call L10.startL10() first.");
    }
    return _instance._translations!;
  }
}
