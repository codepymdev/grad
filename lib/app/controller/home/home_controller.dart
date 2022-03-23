import 'package:get/get.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/repository/home/home_page_repository.dart';

class HomeController extends GetxController with CacheManager {
  var user = {}.obs;
  var _school = "".obs;

  var students = [].obs;
  var teaching = [].obs;
  var non_teaching = [].obs;
  var parents = [].obs;
  var users = [].obs;

  var counter = {}.obs;

  var loading = true.obs;

  @override
  void onInit() async {
    await getUserData();
    await getData();
    super.onInit();
  }

  Future<void> getUserData() async {
    Map<String, dynamic>? data = await getMe();
    if (data != null) {
      user.value = data;
    }
    String? school = await getSchool();
    if (school != null) {
      _school.value = school;
    }
  }

  Future<void> getData() async {
    Map<String, dynamic> _counter = await HomePageRepository.getCounter(
      school: _school.value,
    );
    List<dynamic> _students = await HomePageRepository.getPeople(
      school: _school.value,
      type: "students",
      per_page: "5",
      page: "1",
    );
    List<dynamic> _teaching = await HomePageRepository.getPeople(
      school: _school.value,
      type: "teaching",
      per_page: "5",
      page: "1",
    );
    List<dynamic> _non_teaching = await HomePageRepository.getPeople(
      school: _school.value,
      type: "non-teaching",
      per_page: "5",
      page: "1",
    );

    List<dynamic> _users = await HomePageRepository.getPeople(
      school: _school.value,
      type: "users",
      per_page: "5",
      page: "1",
    );

    List<dynamic> _parents = await HomePageRepository.getPeople(
      school: _school.value,
      type: "parents",
      per_page: "5",
      page: "1",
    );
    students.value = _students;
    teaching.value = _teaching;
    non_teaching.value = _non_teaching;
    users.value = _users;
    parents.value = _parents;

    counter.value = _counter;

    loading.value = false;
  }
}
