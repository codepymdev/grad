import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grad/app/core/utils/app_initializer.dart';
import 'package:grad/app/ui/app.dart';
import 'package:grad/app/ui/app_connectivity_error.dart';
import 'package:grad/app/ui/app_error.dart';
import 'package:grad/app/ui/app_splash_screen.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

Future<void> main() async {
  ///
  /// Initialize storage driver
  ///
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  /// Create a new instance of [StreamChatClient] passing the apikey obtained from your
  /// project dashboard.
  final client = StreamChatClient(
    '26weyexcgwar',
    logLevel: Level.INFO,
  );

  /// Set the current user. In a production scenario, this should be done using
  /// a backend to generate a user token using our server SDK.
  /// Please see the following for more information:
  /// https://getstream.io/chat/docs/flutter-dart/tokens_and_authentication/?language=dart
  await client.connectUser(
    User(id: 'tutorial-flutter'),
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c',
  );

  /// Creates a channel using the type `messaging` and `flutterdevs`.
  /// Channels are containers for holding messages between different members. To
  /// learn more about channels and some of our predefined types, checkout our
  /// our channel docs: https://getstream.io/chat/docs/flutter-dart/creating_channels/?language=dart
  final channel = client.channel('messaging', id: 'flutterdevs');

  /// `.watch()` is used to create and listen to the channel for updates. If the
  /// channel already exists, it will simply listen for new events.
  await channel.watch();

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
                channel: channel,
                client: client,
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
