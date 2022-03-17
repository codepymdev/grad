import 'package:get/get.dart';
import 'package:grad/app/controller/account/account_controller.dart';
import 'package:grad/app/controller/auth/auth_manager_controller.dart';
import 'package:grad/app/controller/home/home_controller.dart';
import 'package:grad/app/controller/navigation/navigation_controller.dart';
import 'package:grad/app/controller/start/welcome_controller.dart';

class AuthManagerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthManagerController>(() => AuthManagerController());
    Get.lazyPut<WelcomeController>(() => WelcomeController());
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
