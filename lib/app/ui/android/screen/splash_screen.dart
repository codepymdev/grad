import 'package:flutter/material.dart';
import 'package:grad/app/ui/theme/android/app_theme.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //set theme value here
    ThemeData? theme = appThemeData[AppTheme.LightTheme];
    ThemeData? darkTheme = appThemeData[AppTheme.DarkTheme];

    return MaterialApp(
      theme: theme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          top: true,
          bottom: true,
          child: Container(
            child: Text("splash screen"),
          ),
        ),
      ),
    );
  }
}
