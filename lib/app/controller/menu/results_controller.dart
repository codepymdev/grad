import 'package:get/get.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/repository/menu/result_repository.dart';

class ResultsController extends GetxController with CacheManager {
  dynamic params = Get.arguments;

  var loading = true.obs;

  var school = "".obs;

  /// campus
  var campus_ = "".obs;

  /// user role
  var r = "".obs;

  var classId = "".obs;

  var classsubjects = [].obs;

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

    if (params['handler'] == "student") {
      classId.value = params['classId'];
      await getClassSubjects();
    }
    ;

    loading.value = false;
    super.onInit();
  }

  Future<void> getClassSubjects() async {
    List<dynamic> response = await ResultRepository.classSubjects(
        classId: classId.value, school: school.value);
    classsubjects.value = response;
  }
}
