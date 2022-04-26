import 'package:get/get.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/repository/home/home_page_repository.dart';
import 'package:grad/app/data/repository/menu/announcement_repository.dart';
import 'package:grad/app/data/repository/start/school_repository.dart';

class HomeController extends GetxController with CacheManager {
  ///user data
  var user = {}.obs;

  /// campus
  var campus = "".obs;

  /// user role
  var r = "".obs;

  /// school
  var _school = "".obs;

  ///students list
  var students = [].obs;

  ///teachers list
  var teaching = [].obs;

  /// non teacher list
  var non_teaching = [].obs;

  /// parents list
  var parents = [].obs;

  /// users list
  var users = [].obs;

  ///counter map
  var counter = {}.obs;

  ///loading
  var loading = true.obs;

  ///school data
  var school_data = {}.obs;

  var hide_announcement = false.obs;

  var hide_school = false.obs;

  var current_announcement = {}.obs;

  @override
  void onInit() async {
    await getUserData();
    await getData();
    await getCurrentAnnouncement();
    await getAllSchools();
    loading.value = false;
    super.onInit();
  }

  Future<void> getUserData() async {
    Map<String, dynamic>? data = await getMe();
    if (data != null) {
      user.value = data;
      campus.value = data["campus"] == "" ? "0" : data["campus"];
      r.value = data["type"];
    }
    String? school = await getSchool();
    if (school != null) {
      _school.value = school;
    }
  }

  Future<void> getAllSchools() async {
    Map<String, dynamic> schools =
        await SchoolRepository.getSchoolData(school: _school.value);
    school_data.value = schools;
  }

  Future<void> getData() async {
    Map<String, dynamic> _counter = await HomePageRepository.getCounter(
      school: _school.value,
      campus: campus.value,
      r: r.value,
    );
    List<dynamic> _students = await HomePageRepository.getPeople(
      school: _school.value,
      campus: campus.value,
      r: r.value,
      type: "students",
      per_page: "5",
      page: "1",
    );
    List<dynamic> _teaching = await HomePageRepository.getPeople(
      school: _school.value,
      campus: campus.value,
      r: r.value,
      type: "teaching",
      per_page: "5",
      page: "1",
    );
    List<dynamic> _non_teaching = await HomePageRepository.getPeople(
      school: _school.value,
      campus: campus.value,
      r: r.value,
      type: "non-teaching",
      per_page: "5",
      page: "1",
    );

    List<dynamic> _users = await HomePageRepository.getPeople(
      school: _school.value,
      campus: campus.value,
      r: r.value,
      type: "users",
      per_page: "5",
      page: "1",
    );

    List<dynamic> _parents = await HomePageRepository.getPeople(
      school: _school.value,
      campus: campus.value,
      r: r.value,
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
  }

  void hideSection(type) {
    if (type == "announcement") {
      if (hide_announcement.value) {
        hide_announcement.value = false;
      } else {
        hide_announcement.value = true;
      }
    } else if (type == "school") {
      if (hide_school.value) {
        hide_school.value = false;
      } else {
        hide_school.value = true;
      }
    }
  }

  Future<void> getCurrentAnnouncement() async {
    Map<String, dynamic> response =
        await AnnouncementRepository.getCurrentAnnouncement(
      school: _school.value,
    );
    current_announcement.value = response;
  }
}
