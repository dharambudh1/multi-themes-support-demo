import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings with ChangeNotifier {
  static final ThemeSettings _singleton = ThemeSettings._internal();
  factory ThemeSettings() => _singleton;
  ThemeSettings._internal();

  SharedPreferences? prefs;
  static const String prefKey = "savedTheme";

  ThemeMode? _myThemeMode;
  ThemeMode get myThemeMode => _myThemeMode ?? ThemeMode.system;
  set myThemeMode(ThemeMode value) => _myThemeMode = value;

  Future<void> setMyThemeMode(ThemeMode value, {bool update = false}) async {
    myThemeMode = value;
    notifyListeners();
    if (update) await prefs?.setString(prefKey, value.name);
    return Future.value();
  }

  void getThemeFromSharedPref() {
    setMyThemeMode(
      ThemeMode.values.firstWhere(
        (e) => e.toString() == "ThemeMode.${prefs?.getString(prefKey)}",
        orElse: () => ThemeMode.system,
      ),
    );
    return;
  }
}
