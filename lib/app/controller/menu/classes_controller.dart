import 'package:get/get.dart';
import 'package:grad/app/core/constants/app_constants.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/model/campus_model.dart';
import 'package:grad/app/data/model/class_categories_model.dart';
import 'package:grad/app/data/repository/menu/class_repository.dart';
import 'package:grad/app/data/repository/settings/settings_repository.dart';

class ClassesController extends GetxController with CacheManager {
  var loading = true.obs;

  var school = "".obs;

  /// campus
  var campus_ = "".obs;

  /// user role
  var r = "".obs;

  var processing = false.obs;

  var classes = [].obs;

  var classCategories = [].obs;
  Rxn<ClassCategoriesModel> classCategory = Rxn<ClassCategoriesModel>();

  var campus = [].obs;
  Rxn<Campus> campus_value = Rxn<Campus>();

  var arm = "Select arm".obs;
  var section = "Select section".obs;

  var classId = 0.obs;

  var error = false.obs;
  var error_msg = "".obs;

  var success = false.obs;
  var success_msg = "".obs;

  var me = {}.obs;
  @override
  void onInit() async {
    Map<String, dynamic>? data = await getMe();
    if (data != null) {
      campus_.value = data["campus"] == "" ? "0" : data["campus"];
      r.value = data["type"];
      me.value = data;
    }

    String? _school = await getSchool();
    if (_school != null) {
      school.value = _school;
    }
    if (r.value == "admin") {
      await getClasses();
    }

    if (r.value == "teaching") {
      await getClasses();
    }

    if (r.value == "parent") {
      await getClasses();
    }

    if (r.value == "non-teaching") {
      await getClasses();
    }

    //get campus
    List<Campus> _campus =
        await SettingsRepository.getCampus(school: school.value);
    campus.value = _campus;

    //get class categories
    List<ClassCategoriesModel> _data = await ClassRepository.classCategories(
      school: school.value,
    );
    classCategories.value = _data;

    loading.value = false;
    super.onInit();
  }

  Future<void> getClasses() async {
    List<dynamic> data = await ClassRepository.getClasses(
      school: school.value,
      campus: campus_.value,
      r: r.value,
      per_page: PER_PAGE,
      page: PAGE,
    );

    classes.value = data;
  }

  Future<void> deleteClass(id) async {
    loading.value = true;
    Map<String, dynamic> _data = await ClassRepository.deleteClass(
      school: school.value,
      id: id,
    );
    if (_data['status']) {
      await getClasses();
    }
    loading.value = false;
  }

  void updateCampusState(Campus x) {
    campus_value.value = x;
  }

  void updateClassName(ClassCategoriesModel x) {
    classCategory.value = x;
  }

  void updateClassArm(String a) {
    arm.value = a;
  }

  void updateClassSection(String s) {
    section.value = s;
  }

  Future<void> createClass(data) async {
    clear();
    if (classCategory.value == null) {
      error.value = true;
      error_msg.value = "Class name is  required";
      processing.value = false;
      return;
    }
    if (section.value == "Select section" || section.value == "") {
      error.value = true;
      error_msg.value = "Class section is  required";
      processing.value = false;
      return;
    }
    if (arm.value == "Select arm" || arm.value == "") {
      error.value = true;
      error_msg.value = "Class arm is  required";
      processing.value = false;
      return;
    }
    if (campus_value.value == null) {
      error.value = true;
      error_msg.value = "Campus is required";
      processing.value = false;
      return;
    }

    data['name'] = classCategory.value != null ? classCategory.value!.name : "";
    data['arm'] = arm.value;
    data['section'] = section.value;
    data['school'] = school.value;
    data['campusId'] =
        campus_value.value != null ? campus_value.value!.id : "0";
    processing.value = true;

    Map<String, dynamic> response = await ClassRepository.addClass(data: data);
    if (response["status"]) {
      success_msg.value = response['message'];
      success.value = true;
      classId.value = response['id'];
    } else {
      if (response['validate']) {
        Map<String, dynamic> resp_mes = response['message'];

        error_msg.value = resp_mes.values.first[0];
        error.value = true;
      } else {
        error_msg.value = response['message'];
        error.value = true;
      }
    }

    processing.value = false;
  }

  void clear() {
    error.value = false;
    error_msg.value = "";

    success.value = false;
    success_msg.value = "";
  }
}
