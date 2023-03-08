import 'package:Grad/app/ui/android/screen/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'dart:io' show Platform;

class AppSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///
    /// check if ios or android
    ///
    if (Platform.isAndroid) {
      //return android app
      return SplashScreen();
    } else {
      //return ios app
      return SplashScreen();
    }
  }
}
