import 'package:flutter/widgets.dart';
import 'package:grad/app/ui/android/android_app.dart';
import 'dart:io' show Platform;

class App extends StatelessWidget {
  final themeValue;
  final channel;
  final client;

  App({
    required this.themeValue,
    required this.channel,
    required this.client,
  });
  @override
  Widget build(BuildContext context) {
    ///
    /// Check if platform is android or ios
    ///
    if (Platform.isAndroid) {
      /// return android app
      return AndroidApp(
        themeValue: themeValue,
        channel: channel,
        client: client,
      );
    } else {
      /// return ios app
      return AndroidApp(
        themeValue: themeValue,
        channel: channel,
        client: client,
      );
    }
  }
}
