import 'package:get/get.dart';
import 'package:grad/app/controller/auth/forgotten_password_controller.dart';

class ForgottenPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgottenPassowrdController>(
        () => ForgottenPassowrdController());
  }
}
