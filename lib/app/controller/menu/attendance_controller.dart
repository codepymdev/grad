import 'package:Grad/app/core/constants/app_constants.dart';
import 'package:Grad/app/core/functions/functions.dart';
import 'package:Grad/app/data/mixins/cache_manager.dart';
import 'package:Grad/app/data/repository/menu/attendance_repository.dart';
import 'package:Grad/app/data/repository/menu/people_repository.dart';
import 'package:Grad/app/data/repository/settings/settings_repository.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

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
  var students = [].obs;
  var student_attendance = [].obs;

  late String tval;
  late String yval;

  var error = false.obs;
  var error_msg = "".obs;
  var success = false.obs;
  var success_msg = "".obs;
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  Rxn<DateTime> initial_date = Rxn<DateTime>();

  var date_ = "".obs;

  var processing = false.obs;

  //list of attendance
  List<dynamic> attendance_list = [].obs;

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
    await get();
    await getClassStudents();
    initial_date.value = DateTime.now();

    date_.value = dateFormat.format(DateTime.now());
    loading.value = false;
    super.onInit();
  }

  Future<void> get() async {
    var data = await AttendanceRepository.attendance(
      classId: classId.value,
      school: school.value,
      year: yval,
      term: tval,
    );
    attendance.value = data;
  }

  Future<void> getAtt({required date}) async {
    var data = await AttendanceRepository.getAtt(
      classId: classId.value,
      school: school.value,
      year: yval,
      term: tval,
      date: date,
    );
    student_attendance.value = data;
  }

  Future<void> getClassStudents() async {
    List<dynamic> _data = await PeopleRepository.getClassStudents(
      school: school.value,
      classId: classId.value,
      per_page: PER_PAGE,
      page: PAGE,
    );
    students.value = _data;
  }

  Future<void> delete({required id}) async {
    loading.value = true;
    await AttendanceRepository.delete(
      school: school.value,
      id: id,
    );
    loading.value = false;
  }

  void clear() {
    error.value = false;
    error_msg.value = "";
    success.value = false;
    success_msg.value = "";
  }

  void addAttendance(id) {
    attendance_list.add(id);
  }

  void removeAttendance(id) {
    attendance_list.remove(id);
  }

  void selectDate(picked) {
    date_.value = dateFormat.format(picked);
  }

  Future<void> addStudentAttendance() async {
    clear();
    loading.value = true;

    var data = await AttendanceRepository.create(data: {
      "school": school.value,
      "classId": classId.value,
      "year": yval,
      "term": tval,
      "date": date_.value,
      "attendance": attendance_list.toList(),
    });
    if (data['status'] == true) {
      success.value = true;
      success_msg.value = data['message'];
    } else {
      error.value = true;
      error_msg.value = data['message'];
    }
    loading.value = false;
  }
}
