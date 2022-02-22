import 'package:get/get.dart';
import 'package:grad/app/controller/navigation/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}
