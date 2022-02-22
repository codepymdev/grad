import 'package:get/get.dart';
import 'package:grad/app/controller/chat/conversation_controller.dart';

class ConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConversationController>(() => ConversationController());
  }
}
