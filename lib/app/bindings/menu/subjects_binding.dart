import 'package:Grad/app/controller/menu/subjects_controller.dart';
import 'package:get/get.dart';

class SubjectsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectsController>(() => SubjectsController());
  }
}
