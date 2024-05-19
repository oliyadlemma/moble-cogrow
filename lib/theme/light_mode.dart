import 'package:flutter/material.dart';

//Light Mode
ThemeData LightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: const Color.fromARGB(255, 255, 255, 255),
      primary: const Color.fromARGB(255, 75, 72, 72),
      secondary: Colors.grey.shade400,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade600,
    ));
