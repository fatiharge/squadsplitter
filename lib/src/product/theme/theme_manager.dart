import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeManager._();

  static final ThemeManager _instance = ThemeManager._();

  static ThemeManager get instance => _instance;

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;
    _themeMode = newThemeMode;
    notifyListeners();
  }
}
