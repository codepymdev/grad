import 'package:grad/app/controller/auth/forgotten_password_controller.dart';
import 'package:get/get.dart';

class ForgottenPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgottenPassowrdController>(
        () => ForgottenPassowrdController());
  }
}
