import 'package:get/get.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/repository/auth/login_repository.dart';
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
    await updateAuthUser();
    loading.value = false;
    super.onInit();
  }

  Future<void> logOut() async {
    //remove stream user
    await discountStream();
    // await OneSignal.shared.removeExternalUserId();
    await removeToken();
    await removeMe();
    await removeSchool();
    isLogin.value = false;
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
    if (token != null) {
      isLogin.value = true;
      final me = getMe();

      await connectStreamUser(me);
    }
  }

  Future<void> updateAuthUser() async {
    final me = getMe();
    if (me != null) {
      Map<String, dynamic>? data = await LoginRepository.updateAuthUser(
          id: me['id'], school: me['school']);
      if (data != null) {
        await saveMe(data);
      }
    }
  }

  Future<void> connectStreamUser(data) async {
    final client = getIt<StreamService>().client;

    final response = await client.connectUser(
      User(
        id: chatStreamId(data['school'], data['id']),
        extraData: {
          'image': data['avatar'],
          'name': data['first_name'] + " " + data['last_name'],
        },
      ),
      data['token'],
    );

    //update unread count
    unreadCount.value = response.totalUnreadCount;
  }

  Future<void> discountStream() async {
    final client = getIt<StreamService>().client;
    await client.disconnectUser();
  }
}
