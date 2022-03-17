import 'package:get/get.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';

class HomeController extends GetxController with CacheManager {
  var user = {}.obs;

  @override
  void onInit() async {
    await getUserData();
    super.onInit();
  }

  Future<void> getUserData() async {
    Map<String, dynamic>? data = await getMe();
    if (data != null) {
      user.value = data;
    }
  }
}
