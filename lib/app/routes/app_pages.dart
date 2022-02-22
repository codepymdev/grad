import 'package:get/route_manager.dart';
import 'package:grad/app/bindings/chats/conversation_binding.dart';
import 'package:grad/app/bindings/navigation/navigation_binding.dart';
import 'package:grad/app/routes/app_routes.dart';
import 'package:grad/app/ui/android/screen/navigation.dart';
import 'package:grad/app/ui/android/widgets/chat/conversation.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => Navigation(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: Routes.CONVERSATION,
      page: () => Conversation(),
      binding: ConversationBinding(),
    ),
  ];
}
