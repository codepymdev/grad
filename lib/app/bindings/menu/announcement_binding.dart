import 'package:grad/app/controller/menu/announcement_controller.dart';
import 'package:get/get.dart';

class AnnouncementBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnnouncementController>(() => AnnouncementController());
  }
}
