import 'package:get/get.dart';
import 'package:grad/app/controller/calendar/calendar_controller.dart';

class CalendarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarController>(() => CalendarController());
  }
}
