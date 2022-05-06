import 'package:get/get.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/repository/menu/attendance_repository.dart';
import 'package:grad/app/data/repository/settings/settings_repository.dart';

class AttendanceController extends GetxController with CacheManager {
  var configs = [].obs;

  dynamic params = Get.arguments;

  var loading = true.obs;

  var school = "".obs;

  /// campus
  var campus_ = "".obs;

  /// user role
  var r = "".obs;

  var classId = "".obs;

  var attendance = [].obs;

  late String tval;
  late String yval;

  var error = false.obs;
  var error_msg = "".obs;
  var success = false.obs;
  var success_msg = "".obs;

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

    configs.value = await SettingsRepository.getConfigSettings(
      school: school.value,
    );
    tval = getConfigValue(configs, "term");
    yval = getConfigValue(configs, "year");
    classId.value = params["classId"];
    await getAttendance();
    loading.value = false;
    super.onInit();
  }

  Future<void> getAttendance() async {
    loading.value = true;
    var data = await AttendanceRepository.attendance(
      classId: classId.value,
      school: school.value,
      studentId: params["studentId"],
      year: yval,
      team: tval,
    );
    attendance.value = data;
    loading.value = false;
  }

  Future<void> create({
    required date,
    required description,
    required holiday,
    required status,
  }) async {
    clear();
    loading.value = true;
    Map<String, dynamic> data = await AttendanceRepository.create(data: {
      "classId": classId.value,
      "studentId": params["studentId"],
      "school": school.value,
      "year": yval,
      "team": tval,
      "date": date,
      "description": description,
      "holiday": holiday,
      "status": status
    });
    if (data['status'] == true) {
      success.value = true;
      success_msg.value = data['message'];
    } else {
      error.value = true;
      error_msg.value = data['message'];
    }
  }

  Future<void> delete({required id}) async {
    loading.value = true;
    await AttendanceRepository.delete(
      school: school.value,
      id: id,
    );
    getAttendance();
    loading.value = false;
  }

  void clear() {
    error.value = false;
    error_msg.value = "";
    success.value = false;
    success_msg.value = "";
  }
}
