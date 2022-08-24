import 'package:grad/app/controller/menu/attendance_controller.dart';
import 'package:get/get.dart';

class AttendanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(() => AttendanceController());
  }
}
