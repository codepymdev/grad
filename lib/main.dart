import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grad/app/core/constants/app_constants.dart';
import 'package:grad/app/core/utils/app_initializer.dart';
import 'package:grad/app/data/services/GetService.dart';
import 'package:grad/app/ui/app.dart';
import 'package:grad/app/ui/app_connectivity_error.dart';
import 'package:grad/app/ui/app_error.dart';
import 'package:grad/app/ui/app_splash_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

late FirebaseMessaging messaging;
Future<void> main() async {
  //set up get it
  await setupLocator();

  ///
  /// Initialize storage driver
  ///
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );

  await Firebase.initializeApp();

  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId(ONE_SIGNAL_APP_ID);

  runApp(
    FutureBuilder<Map<String, dynamic>>(
      future: AppInitializer().appInitializer(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AppSplashScreen();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            Map<String, dynamic> appInitData = snapshot.data;

            ///
            /// check if the connectivity status is === false
            ///
            bool connectivityStatus = appInitData['connectivity_status'];
            if (connectivityStatus) {
              ///
              /// set theme
              ///
              int themeValue = appInitData['app_theme'];
              return App(
                themeValue: themeValue,
              );
            } else {
              ///
              /// show the connectivity error page
              ///
              return AppConnectivityError();
            }
          } else {
            //return error state
            return AppError();
          }
        } else if (snapshot.hasError) {
          //return  error state
          return AppError();
        } else {
          //return  error state
          return AppError();
        }
      },
    ),
  );
}
