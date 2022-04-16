import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/repository/calendar/calendar_repository.dart';
import 'package:grad/app/data/repository/settings/settings_repository.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class NewEventController extends GetxController with CacheManager {
  var processing = false.obs;
  var school = "".obs;
  var userid = "".obs;

  var configs = [].obs;

  var error = false.obs;
  var error_msg = "".obs;

  var success = false.obs;
  var success_msg = "".obs;

  var start_date = "".obs;
  var end_date = "".obs;

  late String tval;
  late String yval;

  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  Rxn<DateTime> initial_date = Rxn<DateTime>();
  @override
  void onInit() async {
    String? _school = await getSchool();
    if (_school != null) {
      school.value = _school;
    }

    Map<String, dynamic>? data = await getMe();
    if (data != null) {
      userid.value = data['id'];
    }

    configs.value = await SettingsRepository.getConfigSettings(
      school: school.value,
    );
    tval = getConfigValue(configs, "term");
    yval = getConfigValue(configs, "year");
    initial_date.value = DateTime.now();

    start_date.value = dateFormat.format(DateTime.now());
    end_date.value = dateFormat.format(DateTime.now());

    super.onInit();
  }

  Future<void> create_event(Map<String, dynamic> data) async {
    processing.value = true;
    clear();

    data['start_date'] = start_date.value;
    data['end_date'] = end_date.value;
    data['userId'] = userid.value;
    data['school'] = school.value;
    data['term'] = tval;
    data['year'] = yval;

    Map<String, dynamic> response = await CalendarRepository.uploadEvent(
      data: data,
    );

    if (response['status']) {
      success.value = true;
      success_msg.value = "Event Created successful";
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

  void selectDate(picked, type) {
    if (type == "start_date") {
      start_date.value = dateFormat.format(picked);
    } else if (type == "end_date") {
      end_date.value = dateFormat.format(picked);
    }
  }

  void clear() {
    success.value = false;
    success_msg.value = "";

    error.value = false;
    error_msg.value = "";
  }

  Future<void> updateEvent(data) async {
    clear();
    processing.value = true;
    data['term'] = tval;
    data['year'] = yval;
    data['start_date'] = start_date.value;
    data['end_date'] = end_date.value;
    data['userId'] = userid.value;
    data['school'] = school.value;
    Map<String, dynamic> response =
        await CalendarRepository.updateEvent(data: data);

    if (response['status']) {
      success.value = true;
      success_msg.value = "Event updated successfully";
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
}
