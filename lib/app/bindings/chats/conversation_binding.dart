import 'package:grad/app/controller/chat/conversation_controller.dart';
import 'package:get/get.dart';

class ConversationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConversationController>(() => ConversationController());
  }
}
