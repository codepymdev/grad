import 'package:get/route_manager.dart';
import 'package:grad/app/routes/app_routes.dart';
import 'package:grad/app/ui/android/screen/navigation.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => Navigation(),
    ),
  ];
}
