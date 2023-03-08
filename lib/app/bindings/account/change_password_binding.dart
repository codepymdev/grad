import 'package:Grad/app/controller/account/change_password_controller.dart';
import 'package:get/get.dart';

class ChangePasswordAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordAccountController>(
        () => ChangePasswordAccountController());
  }
}
