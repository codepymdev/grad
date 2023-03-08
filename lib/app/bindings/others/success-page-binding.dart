import 'package:Grad/app/controller/others/success-page-controller.dart';
import 'package:get/get.dart';

class SuccessPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessPageController>(() => SuccessPageController());
  }
}
