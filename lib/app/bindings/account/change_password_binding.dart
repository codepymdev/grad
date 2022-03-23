import 'package:get/get.dart';
import 'package:grad/app/controller/account/change_password_controller.dart';

class ChangePasswordAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordAccountController>(
        () => ChangePasswordAccountController());
  }
}
