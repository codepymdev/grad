import 'package:get/get.dart';
import 'package:grad/app/controller/auth/create_account_controller.dart';

class CreateAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAccountController>(() => CreateAccountController());
  }
}
