import 'package:get/state_manager.dart';
import 'package:grad/app/controller/auth/auth_manager_controller.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';

class AccountController extends GetxController with CacheManager {
  Future<void> logout() async {
    AuthManagerController authManagerController = AuthManagerController();
    await authManagerController.logOut();
  }
}
