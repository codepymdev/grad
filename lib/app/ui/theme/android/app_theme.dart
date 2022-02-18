import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

enum AppTheme {
  DarkTheme,
  LightTheme,
}

final appThemeData = {
  AppTheme.LightTheme: ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Color(0xff3a7eef),
    primaryColorLight: Color(0xffCBDCF8),
    primaryColorDark: Color.fromARGB(255, 11, 7, 46),
    backgroundColor: Color(0xffCBDCF8),
    indicatorColor: Color(0xffCBDCF8),
    hintColor: Color(0xffEECED3),
    highlightColor: Color(0xffFCE192),
    hoverColor: Color(0xff4285F4),
    focusColor: Color(0xffA8DAB5),
    disabledColor: Colors.grey,
    cardColor: Colors.white,
    canvasColor: Colors.grey[50],
    // fontFamily: 'Dongle',
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    // textTheme: TextTheme(
    //   bodyLarge: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   displayLarge: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   displayMedium: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   displaySmall: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   headlineLarge: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   headlineMedium: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   headlineSmall: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   titleLarge: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   titleMedium: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   titleSmall: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   bodyMedium: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   bodySmall: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   labelLarge: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   labelMedium: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   labelSmall: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   headline1: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   headline2: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   headline3: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   headline4: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   headline5: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   headline6: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   subtitle1: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   subtitle2: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   bodyText1: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   bodyText2: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   caption: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   button: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    //   overline: TextStyle(
    //     color: Colors.grey[850],
    //   ),
    // ),
  ),
  AppTheme.DarkTheme: ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: HexColor("#121212"),
    primaryColorLight: HexColor("#121212"),
    primaryColorDark: HexColor("#121212"),
    backgroundColor: HexColor("#121212"),
    indicatorColor: Color(0xff0E1D36),
    hintColor: Color(0xff280C0B),
    highlightColor: Color(0xff372901),
    hoverColor: Color(0xff3A3A3B),
    focusColor: Color(0xff0B2512),
    disabledColor: Colors.grey,
    cardColor: Color(0xFF151515),
    canvasColor: Colors.black,
    primarySwatch: Colors.red,

    // fontFamily: 'Dongle',
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    // textTheme: TextTheme(
    //   bodyLarge: TextStyle(
    //     color: Colors.white,
    //   ),
    //   displayLarge: TextStyle(
    //     color: Colors.white,
    //   ),
    //   displayMedium: TextStyle(
    //     color: Colors.white,
    //   ),
    //   displaySmall: TextStyle(
    //     color: Colors.white,
    //   ),
    //   headlineLarge: TextStyle(
    //     color: Colors.white,
    //   ),
    //   headlineMedium: TextStyle(
    //     color: Colors.white,
    //   ),
    //   headlineSmall: TextStyle(
    //     color: Colors.white,
    //   ),
    //   titleLarge: TextStyle(
    //     color: Colors.white,
    //   ),
    //   titleMedium: TextStyle(
    //     color: Colors.white,
    //   ),
    //   titleSmall: TextStyle(
    //     color: Colors.white,
    //   ),
    //   bodyMedium: TextStyle(
    //     color: Colors.white,
    //   ),
    //   bodySmall: TextStyle(
    //     color: Colors.white,
    //   ),
    //   labelLarge: TextStyle(
    //     color: Colors.white,
    //   ),
    //   labelMedium: TextStyle(
    //     color: Colors.white,
    //   ),
    //   labelSmall: TextStyle(
    //     color: Colors.white,
    //   ),
    //   headline1: TextStyle(
    //     color: Colors.white,
    //   ),
    //   headline2: TextStyle(
    //     color: Colors.white,
    //   ),
    //   headline3: TextStyle(
    //     color: Colors.white,
    //   ),
    //   headline4: TextStyle(
    //     color: Colors.white,
    //   ),
    //   headline5: TextStyle(
    //     color: Colors.white,
    //   ),
    //   headline6: TextStyle(
    //     color: Colors.white,
    //   ),
    //   subtitle1: TextStyle(
    //     color: Colors.white,
    //   ),
    //   subtitle2: TextStyle(
    //     color: Colors.white,
    //   ),
    //   bodyText1: TextStyle(
    //     color: Colors.white,
    //   ),
    //   bodyText2: TextStyle(
    //     color: Colors.white,
    //   ),
    //   caption: TextStyle(
    //     color: Colors.white,
    //   ),
    //   button: TextStyle(
    //     color: Colors.white,
    //   ),
    //   overline: TextStyle(
    //     color: Colors.white,
    //   ),
    // ),
  ),
};
