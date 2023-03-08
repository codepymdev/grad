import 'package:Grad/app/controller/account/account_controller.dart';
import 'package:Grad/app/controller/auth/auth_manager_controller.dart';
import 'package:Grad/app/controller/home/home_controller.dart';
import 'package:Grad/app/controller/navigation/navigation_controller.dart';
import 'package:Grad/app/controller/start/welcome_controller.dart';
import 'package:get/get.dart';

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
