import 'package:get/get.dart';
import 'package:grad/app/controller/menu/classtimetable_controller.dart';

class ClassTimetableBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassTimetableController>(() => ClassTimetableController());
  }
}
