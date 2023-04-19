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
    indicatorColor: Color(0xffCBDCF8),
    hintColor: Color(0xffEECED3),
    highlightColor: Color(0xffFCE192),
    hoverColor: Color(0xff4285F4),
    focusColor: Color(0xffA8DAB5),
    disabledColor: Colors.grey,
    cardColor: Colors.white,
    canvasColor: Colors.grey[50],
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  AppTheme.DarkTheme: ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: HexColor("#121212"),
    primaryColorLight: HexColor("#121212"),
    primaryColorDark: HexColor("#121212"),
    indicatorColor: Color(0xff0E1D36),
    hintColor: Color(0xff280C0B),
    highlightColor: Color(0xff372901),
    hoverColor: Color(0xff3A3A3B),
    focusColor: Color(0xff0B2512),
    disabledColor: Colors.grey,
    cardColor: Color(0xFF151515),
    canvasColor: Colors.black,
    primarySwatch: Colors.red,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
};
