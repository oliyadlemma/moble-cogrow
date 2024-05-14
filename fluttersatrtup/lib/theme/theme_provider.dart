import 'package:flutter/material.dart';
import 'package:fluttersatrtup/theme/dark_mode.dart';
import 'package:fluttersatrtup/theme/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  // Initially, the theme is set to light mode
  ThemeData _themeData = LightMode;

  // Getter method to access the theme from other parts of the code
  ThemeData get themeData => _themeData;

  //getter method to see if we are in dark
  bool get isDarkMode => _themeData == darkMode;

  // Setter method to set the theme and notify listeners
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // Toggle between light and dark mode
  void toggleTheme() {
    if (_themeData == LightMode) {
      themeData = darkMode;
    } else {
      themeData = LightMode;
    }
  }
}
