import 'package:Grad/app/bindings/auth/auth_manager_binding.dart';
import 'package:Grad/app/data/services/GetService.dart';
import 'package:Grad/app/data/services/StreamService.dart';
import 'package:Grad/app/routes/app_pages.dart';
import 'package:Grad/app/routes/app_routes.dart';
import 'package:Grad/app/ui/theme/android/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class AndroidApp extends StatelessWidget {
  final themeValue;
  AndroidApp({
    required this.themeValue,
  });
  @override
  Widget build(BuildContext context) {
    ThemeData? selectedTheme;
    // ThemeData? darkTheme;
    // darkTheme = appThemeData[AppTheme.DarkTheme];
    if (themeValue == 1) {
      selectedTheme = appThemeData[AppTheme.LightTheme];
    } else if (themeValue == 2) {
      selectedTheme = appThemeData[AppTheme.DarkTheme];
    } else {
      selectedTheme = appThemeData[AppTheme.LightTheme];
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Color.fromARGB(255, 11, 7, 46),
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
      ),
      child: GetMaterialApp(
        builder: ((context, widget) {
          return StreamChat(
            client: getIt<StreamService>().client,
            child: widget,
            streamChatThemeData: StreamChatThemeData.fromTheme(selectedTheme!),
          );
        }),
        theme: selectedTheme,
        // darkTheme: darkTheme,
        defaultTransition: Transition.fade,
        locale: Locale('pt', 'BR'),
        getPages: AppPages.pages,
        initialRoute: Routes.initial,
        initialBinding: AuthManagerBinding(),
      ),
    );
  }
}
