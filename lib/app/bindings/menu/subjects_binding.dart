import 'package:get/get.dart';
import 'package:grad/app/controller/menu/subjects_controller.dart';

class SubjectsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectsController>(() => SubjectsController());
  }
}
