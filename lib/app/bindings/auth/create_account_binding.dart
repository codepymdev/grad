import 'package:Grad/app/controller/auth/create_account_controller.dart';
import 'package:get/get.dart';

class CreateAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAccountController>(() => CreateAccountController());
  }
}
