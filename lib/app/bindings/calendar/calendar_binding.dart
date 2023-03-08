import 'package:Grad/app/controller/calendar/calendar_controller.dart';
import 'package:get/get.dart';

class CalendarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarController>(() => CalendarController());
  }
}
