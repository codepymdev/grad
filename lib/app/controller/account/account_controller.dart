import 'package:get/state_manager.dart';
import 'package:grad/app/controller/auth/auth_manager_controller.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/repository/account/profile_repository.dart';
import 'package:grad/app/data/repository/home/home_page_repository.dart';

class AccountController extends GetxController with CacheManager {
  Future<void> logout() async {
    AuthManagerController authManagerController = AuthManagerController();
    await authManagerController.logOut();
  }

  var activities = [].obs;

  var userid = "".obs;
  var school = "".obs;

  /// campus
  var campus = "".obs;

  /// user role
  var r = "".obs;

  var loading = true.obs;

  var counter = {}.obs;

  @override
  void onInit() async {
    Map<String, dynamic>? data = await getMe();
    if (data != null) {
      userid.value = data['id'];
      campus.value = data["campus"] == "" ? "0" : data["campus"];
      r.value = data["type"];
    }
    String? _school = await getSchool();
    if (_school != null) {
      school.value = _school;
    }

    Map<String, dynamic> _counter = await HomePageRepository.getCounter(
      school: school.value,
      campus: campus.value,
      r: r.value,
    );

    counter.value = _counter;

    await getActivities();

    loading.value = false;
    super.onInit();
  }

  Future<void> getActivities() async {
    List<dynamic> data = await ProfileRepository.getRecentActivities(
      school: school.value,
      userid: userid.value,
      per_page: 5,
      page: 1,
    );

    activities.value = data;
  }
}
