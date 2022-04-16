import 'package:get/get.dart';
import 'package:grad/app/controller/menu/announcement_controller.dart';

class AnnouncementBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnnouncementController>(() => AnnouncementController());
  }
}
