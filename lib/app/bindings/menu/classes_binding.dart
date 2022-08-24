import 'package:grad/app/controller/menu/classes_controller.dart';
import 'package:get/get.dart';

class ClassesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassesController>(() => ClassesController());
  }
}
