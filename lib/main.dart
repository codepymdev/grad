import 'package:Grad/app/core/constants/app_constants.dart';
import 'package:Grad/app/core/utils/app_initializer.dart';
import 'package:Grad/app/data/services/GetService.dart';
import 'package:Grad/app/data/services/StreamService.dart';
import 'package:Grad/app/ui/app.dart';
import 'package:Grad/app/ui/app_connectivity_error.dart';
import 'package:Grad/app/ui/app_error.dart';
import 'package:Grad/app/ui/app_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';

import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  handleNotification(message);
}

void handleNotification(
  RemoteMessage message,
) async {
  StreamChatClient chatClient = getIt<StreamService>().client;
  final data = message.data;
  if (data['type'] == 'message.new') {
    final flutterLocalNotificationsPlugin = await setupLocalNotifications();
    final messageId = data['id'];
    final response = await chatClient.getMessage(messageId);
    flutterLocalNotificationsPlugin.show(
      1,
      'New message from ${response.message.user!.name} in ${response.channel!.name}',
      response.message.text,
      NotificationDetails(
          android: AndroidNotificationDetails(
        'new_message',
        'New message notifications channel',
      )),
    );
  }
}

Future<FlutterLocalNotificationsPlugin> setupLocalNotifications() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('launch_background');
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  return flutterLocalNotificationsPlugin;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //set up get it
  await setupLocator();

  ///
  /// Initialize storage driver
  ///
  await GetStorage.init();

  await FlutterDownloader.initialize(debug: ISDEBUGMODE);

  await Firebase.initializeApp();

  //Remove this method to stop OneSignal Debugging
  // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId(ONE_SIGNAL_APP_ID);

  final fcmToken = await FirebaseMessaging.instance.getToken();

  print("Token -> $fcmToken Here");

  void setupNotifications() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    void updateToken(String token) {
      getIt<StreamService>().client.addDevice(token, PushProvider.firebase);
    }

    // messaging.getToken().then(updateToken);
    messaging.onTokenRefresh.listen(updateToken);

    FirebaseMessaging.onMessage.listen((message) async {
      print('message.data: ${message.data}');
      handleNotification(message);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  setupNotifications();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
