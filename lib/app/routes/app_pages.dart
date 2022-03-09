import 'package:get/route_manager.dart';
import 'package:grad/app/bindings/auth/auth_manager_binding.dart';
import 'package:grad/app/bindings/auth/forgotten_password_binding.dart';
import 'package:grad/app/bindings/auth/login_binding.dart';
import 'package:grad/app/bindings/calendar/new_event_binding.dart';
import 'package:grad/app/bindings/chats/conversation_binding.dart';
import 'package:grad/app/bindings/navigation/navigation_binding.dart';
import 'package:grad/app/bindings/start/welcome_binding.dart';
import 'package:grad/app/routes/app_routes.dart';
import 'package:grad/app/ui/android/screen/auth/forgotten_password.dart';
import 'package:grad/app/ui/android/screen/auth/login.dart';
import 'package:grad/app/ui/android/screen/calendar/new_event.dart';
import 'package:grad/app/ui/android/screen/navigation.dart';
import 'package:grad/app/ui/android/screen/onboard.dart';
import 'package:grad/app/ui/android/widgets/chat/conversation.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => OnBoard(),
      bindings: [
        AuthManagerBinding(),
        WelcomeBinding(),
      ],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => Navigation(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: Routes.CONVERSATION,
      page: () => Conversation(),
      binding: ConversationBinding(),
    ),
    GetPage(
      name: Routes.NEW_EVENT,
      page: () => NewEvent(),
      binding: NewEventBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.FORGOTTEN_PASSWORD,
      page: () => ForgottenPassword(),
      binding: ForgottenPasswordBinding(),
    ),
  ];
}
