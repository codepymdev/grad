import 'package:Grad/app/controller/auth/verify_account_controller.dart';
import 'package:get/get.dart';

class VerifyAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyAccountController>(() => VerifyAccountController());
  }
}
