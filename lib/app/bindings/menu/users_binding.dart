import 'package:grad/app/controller/menu/users_controller.dart';
import 'package:get/get.dart';

class UsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersController>(() => UsersController());
  }
}
