import 'package:get/get.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';

class AuthManagerController extends GetxController with CacheManager {
  //obs login status
  final isLogin = false.obs;

  void logOut() {
    isLogin.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogin.value = true;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogin.value = true;
    }
  }

  void checkFirstTimeStatus() {
    final secondtoken = getSecondToken();
    if (secondtoken != null) {}
  }
}
