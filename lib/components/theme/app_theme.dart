import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeModel() {
    return ThemeData(
        textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'Futura',
          fontSize: 18.0,
          letterSpacing: 1.0,
          fontWeight: FontWeight.w500,
          color: Color(0XFF121313)),
      displayMedium: TextStyle(
          fontFamily: 'Futura',
          fontSize: 14.0,
          letterSpacing: 1.0,
          fontWeight: FontWeight.w500,
          color: Color(0XFF121313)),
      displaySmall: TextStyle(
          fontFamily: 'Futura',
          fontSize: 10.0,
          letterSpacing: 1.0,
          fontWeight: FontWeight.w300,
          color: Color(0XFF121313)),
      titleLarge: TextStyle(
          fontFamily: 'Futura',
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Color(0XFF121313)),
      titleSmall: TextStyle(
          fontFamily: 'Futura',
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Color(0XFF121313)),
      bodyLarge: TextStyle(
          fontFamily: 'Futura',
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
          color: Color(0XFF121313)),
      bodyMedium: TextStyle(
          fontFamily: 'Futura',
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          color: Color(0XFF121313)),
      labelLarge: TextStyle(
          fontFamily: 'Futura',
          fontSize: 12.0,
          fontWeight: FontWeight.w300,
          color: Color(0XFF121313)),
      labelMedium: TextStyle(
          fontFamily: 'Futura',
          fontSize: 12.0,
          fontWeight: FontWeight.w800,
          decoration: TextDecoration.underline,
          color: Color(0XFF121313)),
      labelSmall: TextStyle(
          fontFamily: 'Futura',
          fontSize: 10.0,
          fontWeight: FontWeight.w300,
          color: Color(0XFF121313)),
    ));
  }
}
