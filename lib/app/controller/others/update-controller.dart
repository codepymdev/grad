import 'package:get/get.dart';
import 'package:grad/app/controller/account/account_controller.dart';
import 'package:grad/app/controller/calendar/calendar_controller.dart';
import 'package:grad/app/controller/home/home_controller.dart';

class UpdateController extends GetxController {
  Future<void> updateSession() async {
    //home controller
    await Get.find<HomeController>().getUserData();
    await Get.find<HomeController>().getData();
    await Get.find<HomeController>().getCurrentAnnouncement();
    await Get.find<HomeController>().getCurrentAnnouncement();

    await Get.find<CalendarController>().get_upcoming_events();
    await Get.find<CalendarController>().get_other_events();

    await Get.find<AccountController>().getActivities();
  }
}
