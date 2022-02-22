import 'package:get/get.dart';
import 'package:grad/app/controller/chat/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
