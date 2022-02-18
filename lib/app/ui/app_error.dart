import 'package:flutter/widgets.dart';
import 'package:grad/app/ui/android/screen/errors/error.dart';
import 'dart:io' show Platform;

class AppError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///
    /// check if ios or android
    ///
    if (Platform.isAndroid) {
      //return Android app
      return ErrorPage();
    } else {
      //return ios app
      return ErrorPage();
    }
  }
}
