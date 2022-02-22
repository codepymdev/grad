import 'package:get/get.dart';
import 'package:grad/app/controller/account/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
