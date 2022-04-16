import 'package:get/get.dart';
import 'package:grad/app/controller/menu/users_controller.dart';

class UsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersController>(() => UsersController());
  }
}
