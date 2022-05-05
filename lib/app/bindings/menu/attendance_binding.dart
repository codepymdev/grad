import 'package:get/get.dart';
import 'package:grad/app/controller/menu/attendance_controller.dart';

class AttendanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(() => AttendanceController());
  }
}
