import 'package:get/get.dart';
import 'package:grad/app/controller/menu/classes_controller.dart';

class ClassesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassesController>(() => ClassesController());
  }
}
