import 'package:get/instance_manager.dart';
import 'package:grad/app/controller/calendar/new_event_controller.dart';

class NewEventBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewEventController>(() => NewEventController());
  }
}
