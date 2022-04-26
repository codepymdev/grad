import 'package:get/get.dart';
import 'package:grad/app/core/constants/app_constants.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/model/campus_model.dart';
import 'package:grad/app/data/model/role_model.dart';
import 'package:grad/app/data/repository/menu/people_repository.dart';
import 'package:grad/app/data/repository/settings/settings_repository.dart';

class UsersController extends GetxController with CacheManager {
  dynamic params = Get.arguments;

  var loading = true.obs;
  var school = "".obs;
  var users = [].obs;

  /// user role
  var r = "".obs;
  var campus_ = "".obs;

  var processing = false.obs;

  var campus = [].obs;
  Rxn<Campus> campus_value = Rxn<Campus>();

  var roles = [].obs;
  Rxn<Role> role_value = Rxn<Role>();

  var gender = "Select gender".obs;

  var stafftype = "Select staff type".obs;

  var success = false.obs;
  var success_msg = "".obs;

  var error = false.obs;
  var error_msg = "".obs;

  var userId = 0.obs;

  var students = [].obs;

  ///
  ///parents
  var parents = [].obs;

  ///
  ///staffs
  var staffs = [].obs;

  ///
  ///teachers
  var teachers = [].obs;

  var classId = "".obs;

  @override
  void onInit() async {
    Map<String, dynamic>? data = await getMe();
    if (data != null) {
      campus_.value = data["campus"] == "" ? "0" : data["campus"];
      r.value = data["type"];
    }

    String? _school = await getSchool();
    if (_school != null) {
      school.value = _school;
    }

    //get roles
    List<Role> _roles =
        await SettingsRepository.getRoles(school: school.value, type: "admin");
    roles.value = _roles;

    //get campus
    List<Campus> _campus =
        await SettingsRepository.getCampus(school: school.value);
    campus.value = _campus;

    if (params['handler'] == "users") await getUsers();
    if (params['handler'] == "parents") await getParents();
    if (params['handler'] == "staffs") await getStaffs();
    if (params['handler'] == "students") await getClassStudents(params['id']);

    loading.value = false;
    super.onInit();
  }

  void updateGenderState(String g) {
    gender.value = g;
  }

  void updateStaffTypeState(String t) {
    if (t == "Teaching") {
      stafftype.value = "teaching";
    } else if (t == "Non-teaching") {
      stafftype.value = "non-teaching";
    } else {
      stafftype.value = t;
    }
  }

  void updateCampusState(Campus x) {
    campus_value.value = x;
  }

  void updateRoleState(Role x) {
    role_value.value = x;
  }

  Future<void> getUsers() async {
    List<dynamic> _users = await PeopleRepository.getPeople(
      school: school.value,
      campus: campus_.value,
      r: r.value,
      type: "users",
      per_page: PER_PAGE,
      page: PAGE,
    );

    users.value = _users;
  }

  ///
  /// create user
  Future<void> createUser(Map<String, dynamic> data) async {
    processing.value = true;

    if (data['first_name'] == null || data['first_name'] == "") {
      error.value = true;
      error_msg.value = "First name is required";
      processing.value = false;
      return;
    }

    if (data['last_name'] == null || data['last_name'] == "") {
      error.value = true;
      error_msg.value = "Last name is required";
      processing.value = false;
      return;
    }

    if (data.containsKey("type")) {
      if (data['type'] != "student") {
        if (data['email'] == null || data['email'] == "") {
          error.value = true;
          error_msg.value = "Email is required";
          processing.value = false;
          return;
        }
      }
    }

    if (gender.value == "Select gender" || gender.value == "") {
      error.value = true;
      error_msg.value = "Gender is  required";
      processing.value = false;
      return;
    }

    if (campus_value.value == null) {
      error.value = true;
      error_msg.value = "Campus is  required";
      processing.value = false;
      return;
    }

    if (role_value.value == null) {
      error.value = true;
      error_msg.value = "Role is  required";
      processing.value = false;
      return;
    }

    if (data['type'] != "student")
      data['roleId'] = role_value.value != null ? role_value.value!.id : "0";
    data['campus'] = campus_value.value != null ? campus_value.value!.id : "0";
    data['gender'] = gender.value;
    data['school'] = school.value;
    Map<String, dynamic> _data = await PeopleRepository.createUser(data);
    if (_data["status"]) {
      success_msg.value = _data['message'];
      success.value = true;
      userId.value = _data['id'];
    } else {
      if (_data['validate']) {
        Map<String, dynamic> resp_mes = _data['message'];

        error_msg.value = resp_mes.values.first[0];
        error.value = true;
      } else {
        error_msg.value = _data['message'];
        error.value = true;
      }
    }

    processing.value = false;
  }

  Future<void> getClassStudents(id) async {
    loading.value = true;

    ///
    ///update classId
    classId.value = id;
    List<dynamic> _data = await PeopleRepository.getClassStudents(
      school: school.value,
      classId: id,
      per_page: PER_PAGE,
      page: PAGE,
    );
    students.value = _data;
    loading.value = false;
  }

  Future<void> getParents() async {
    List<dynamic> _users = await PeopleRepository.getPeople(
      school: school.value,
      campus: campus_.value,
      r: r.value,
      type: "parents",
      per_page: PER_PAGE,
      page: PAGE,
    );

    parents.value = _users;
  }

  Future<void> getStaffs() async {
    List<dynamic> _users = await PeopleRepository.getPeople(
      school: school.value,
      campus: campus_.value,
      r: r.value,
      type: "non-teaching",
      per_page: PER_PAGE,
      page: PAGE,
    );
    List<dynamic> _users2 = await PeopleRepository.getPeople(
      school: school.value,
      campus: campus_.value,
      r: r.value,
      type: "teaching",
      per_page: PER_PAGE,
      page: PAGE,
    );
    teachers.value = _users2;
    staffs.value = _users;
  }

  Future<void> deleteUser({required id, required type}) async {
    loading.value = true;
    Map<String, dynamic> _data = await PeopleRepository.deleteUser(
      school: school.value,
      id: id,
      type: type,
    );
    if (_data['status']) {
      if (type == "admin") {
        await getUsers();
      } else if (type == "parent") {
        await getParents();
      } else if (type == "staff") {
        await getStaffs();
      } else if (type == "student") {
        await getClassStudents(classId.value);
      }
      loading.value = false;
    }
  }
}
