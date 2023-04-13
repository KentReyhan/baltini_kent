import 'package:baltini_kent/components/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeModel() {
    return ThemeData(
        textTheme: TextThemeList.textThemeListReturn(),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle()));
  }
}
