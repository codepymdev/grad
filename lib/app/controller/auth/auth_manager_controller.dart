import 'package:get/get.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';

class AuthManagerController extends GetxController with CacheManager {
  //obs login status
  final isLogin = false.obs;

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  Future<void> logOut() async {
    isLogin.value = false;
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

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogin.value = true;
    }
  }
}
