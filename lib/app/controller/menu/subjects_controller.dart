import 'package:get/get.dart';
import 'package:grad/app/core/constants/app_constants.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/model/subject_categories.dart';
import 'package:grad/app/data/repository/menu/subject_repository.dart';

class SubjectsController extends GetxController with CacheManager {
  var loading = true.obs;

  var school = "".obs;

  /// campus
  var campus = "".obs;

  /// user role
  var r = "".obs;

  var processing = false.obs;

  var subjects = [].obs;

  var subjectCategories = [].obs;
  Rxn<SubjectCategoriesModel> subjectCategory = Rxn<SubjectCategoriesModel>();

  var error = false.obs;
  var error_msg = "".obs;

  var success = false.obs;
  var success_msg = "".obs;
  var me = {}.obs;
  @override
  void onInit() async {
    Map<String, dynamic>? data = await getMe();
    if (data != null) {
      campus.value = data["campus"] == "" ? "0" : data["campus"];
      r.value = data["type"];
      me.value = data;
    }

    String? _school = await getSchool();
    if (_school != null) {
      school.value = _school;
    }
    if (r.value == "admin") {
      await getSubjects();
    }
    if (r.value == "teaching") {
      await getSubjects();
    }
    if (r.value == "non-teaching") {
      await getSubjects();
    }
    if (r.value == "teaching") {
      await getSubjects();
    }
    if (r.value == "parent") {
      await getSubjects();
    }
    //get subject categories
    List<SubjectCategoriesModel> _data =
        await SubjectRepository.subjectCategories(
      school: school.value,
    );
    subjectCategories.value = _data;

    loading.value = false;
    super.onInit();
  }

  Future<void> getSubjects() async {
    List<dynamic> data = await SubjectRepository.getSubjects(
      school: school.value,
      campus: campus.value,
      r: r.value,
      per_page: PER_PAGE,
      page: PAGE,
    );

    subjects.value = data;
  }

  Future<void> deleteSubject(id) async {
    loading.value = true;
    Map<String, dynamic> _data = await SubjectRepository.deleteSubject(
      school: school.value,
      id: id,
    );
    if (_data['status']) {
      await getSubjects();
    }
    loading.value = false;
  }

  void updateSubjectName(SubjectCategoriesModel x) {
    subjectCategory.value = x;
  }

  Future<void> createSubject(data) async {
    clear();
    processing.value = true;

    if (subjectCategory.value == null) {
      error.value = true;
      error_msg.value = "Subject is required";
      processing.value = false;
      return;
    }
    data['name'] =
        subjectCategory.value != null ? subjectCategory.value!.name : "";
    data['school'] = school.value;
    Map<String, dynamic> response =
        await SubjectRepository.addSubject(data: data);
    if (response["status"]) {
      success_msg.value = response['message'];
      success.value = true;
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
