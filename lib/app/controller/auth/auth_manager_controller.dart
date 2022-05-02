import 'package:get/get.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/services/GetService.dart';
import 'package:grad/app/data/services/StreamService.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class AuthManagerController extends GetxController with CacheManager {
  //obs login status
  final isLogin = false.obs;
  //unread message count
  final unreadCount = 0.obs;

  final loading = true.obs;

  @override
  Future<void> onInit() async {
    await checkLoginStatus();
    loading.value = false;
    super.onInit();
  }

  Future<void> logOut() async {
    isLogin.value = false;
    //remove client from stream chat
    final client = getIt<StreamService>().client;
    await client.disconnectUser();

    await removeToken();
    await removeMe();
    await removeSchool();
  }

  void login(Map<String, dynamic>? data) async {
    isLogin.value = true;
    //Token is cached
    await saveToken(data!['email']);
    await saveSchool(data['school']);
    await saveMe(data);
  }

  Future<void> checkLoginStatus() async {
    final token = getToken();
    final me = getMe();

    if (token != null) {
      final client = getIt<StreamService>().client;
      //stream
      if (me != null) {
        final response = await client.connectUser(
          User(
            id: chatStreamId(me['first_name'], me['id']),
            extraData: {
              'image': me['avatar'],
              'name': me['first_name'] + " " + me['last_name'],
            },
          ),
          me['token'],
        );
        //update unread count
        unreadCount.value = response.totalUnreadCount;
      }
      isLogin.value = true;
    }
  }
}
