import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/repository/calendar/calendar_repository.dart';
import 'package:grad/app/data/repository/settings/settings_repository.dart';
import 'package:get/state_manager.dart';

import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController with CacheManager {
  //user type
  var user_group = "".obs;

  var configs = [].obs;
  var school = "".obs;
  var loading = true.obs;
  var upcoming_events = [].obs;

  var other_events = [].obs;

  late String tval;
  late String yval;

  var calendarformat = Rxn<CalendarFormat>();

  var success = false.obs;
  var success_msg = "".obs;

  var error = false.obs;
  var error_msg = "".obs;

  @override
  void onInit() async {
    calendarformat.value = CalendarFormat.week;
    String? _school = await getSchool();
    if (_school != null) {
      school.value = _school;
    }
    configs.value = await SettingsRepository.getConfigSettings(
      school: school.value,
    );

    Map<String, dynamic>? me = await getMe();
    if (me != null) {
      user_group.value = me['type'];
    }
    tval = getConfigValue(configs, "term");
    yval = getConfigValue(configs, "year");

    await get_upcoming_events();
    await get_other_events();
    loading.value = false;
    super.onInit();
  }

  Future<void> get_upcoming_events() async {
    //get current month

    List<dynamic> response = await CalendarRepository.events(
      term: tval,
      year: yval,
      school: school.value,
      type: "upcoming",
      per_page: 10,
      page: 1,
    );

    upcoming_events.value = response;
  }

  Future<void> get_other_events() async {
    //get current month

    List<dynamic> response = await CalendarRepository.events(
      term: tval,
      year: yval,
      school: school.value,
      type: "other",
      per_page: 10,
      page: 1,
    );

    other_events.value = response;
  }

  Future<void> changeCalenderFormat(format) async {
    calendarformat.value = format;
  }

  ///
  /// delete
  ///
  Future<void> deleteEvent(id) async {
    loading.value = true;
    Map<String, dynamic> response = await CalendarRepository.deleteEvent(
      school: school.value,
      id: id,
    );
    get_other_events();
    if (response['status']) {
      success.value = true;
      success_msg.value = "Event deleted successfully";
    } else {
      error.value = true;
      error_msg.value = response['message'];
    }
    loading.value = false;
  }
}
