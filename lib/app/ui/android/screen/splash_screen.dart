import 'package:flutter/material.dart';
import 'package:grad/app/ui/theme/android/app_theme.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //set theme value here
    ThemeData? theme = appThemeData[AppTheme.LightTheme];
    // ThemeData? darkTheme = appThemeData[AppTheme.DarkTheme];

    return MaterialApp(
      theme: theme,
      // darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/logo/logo.png",
                width: 200,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
