import 'package:grad/app/core/utils/app_connectivity.dart';
import 'package:grad/app/core/utils/theme_preferebce.dart';

///
/// Appp initalizer
/// This check for internet connectiviity
/// on the user device
///

class AppInitializer {
  ///
  /// initialize the app
  /// check connectivity
  /// get theme
  /// check if first time coming to the app if so check if login
  ///
  ///
  Future<Map<String, dynamic>> appInitializer() async {
    /**
     * get Notification status
     */
    AppConnectivity appConnectivity = new AppConnectivity();
    await appConnectivity.initConnectivity();
    bool connectivityStatus = appConnectivity.isOnline;

    /**
     * get app theme 
     */
    ThemePreference themePreference = new ThemePreference();
    int value = await themePreference.getTheme();

    //set delay
    await Future.delayed(Duration(seconds: 5));

    Map<String, dynamic> data = {
      "connectivity_status": connectivityStatus,
      "app_theme": value,
    };
    return data;
  }
}
