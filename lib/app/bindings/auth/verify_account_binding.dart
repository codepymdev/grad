import 'package:get/get.dart';
import 'package:grad/app/controller/auth/verify_account_controller.dart';

class VerifyAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyAccountController>(() => VerifyAccountController());
  }
}
