import 'package:grad/app/controller/auth/auth_manager_controller.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var authController = Get.find<AuthManagerController>();

  var tabIndex = 0;
  var messagecount = 0.obs;

  @override
  void onInit() {
    messagecount.value = authController.unreadCount.value;
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    messagecount.value = authController.unreadCount.value;
    update();
  }
}
