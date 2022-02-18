import 'package:flutter/widgets.dart';
import 'package:grad/app/ui/android/android_app.dart';
import 'dart:io' show Platform;

class App extends StatelessWidget {
  final themeValue;
  App({required this.themeValue});
  @override
  Widget build(BuildContext context) {
    ///
    /// Check if platform is android or ios
    ///
    if (Platform.isAndroid) {
      /// return android app
      return AndroidApp(
        themeValue: themeValue,
      );
    } else {
      /// return ios app
      return AndroidApp(
        themeValue: themeValue,
      );
    }
  }
}
