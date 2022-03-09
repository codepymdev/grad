import 'package:get/get.dart';
import 'package:grad/app/controller/auth/auth_manager_controller.dart';
import 'package:grad/app/controller/start/welcome_controller.dart';

class AuthManagerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthManagerController>(() => AuthManagerController());
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
