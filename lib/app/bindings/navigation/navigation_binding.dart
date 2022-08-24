import 'package:grad/app/controller/navigation/navigation_controller.dart';
import 'package:get/get.dart';

class NavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}
