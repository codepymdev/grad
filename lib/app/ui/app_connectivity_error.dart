import 'package:grad/app/ui/android/screen/errors/connectivity_error.dart';
import 'package:flutter/widgets.dart';
import 'dart:io' show Platform;

class AppConnectivityError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///
    /// check if ios or android
    ///
    if (Platform.isAndroid) {
      //return android app
      return ConnectivityError();
    } else {
      //return ios app
      return ConnectivityError();
    }
  }
}
