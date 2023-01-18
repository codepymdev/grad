import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassTimetableController extends GetxController {
  var loading = true.obs;
  var days = "Select day".obs;

  var start_time = "".obs;
  var end_time = "".obs;
  TimeOfDay timeofDay = TimeOfDay.now();
  var initial_time = "".obs;

  var msg = "".obs;

  var error = false.obs;
  var success = false.obs;

  var processing = false.obs;

  var subjects = {}.obs;

  var arguments = Get.arguments;
  var classid = "";

  @override
  void onInit() {
    start_time.value =
        "${timeofDay.hour}:${timeofDay.minute} ${timeofDay.period.name}";
    end_time.value =
        "${timeofDay.hour}:${timeofDay.minute} ${timeofDay.period.name}";

    if (arguments != null) {
      classid = arguments['classid'].toString();
    }

    print(classid);
    loading.value = false;
    super.onInit();
  }

  void getSubjects() async {}
  void updateDays(String s) {
    days.value = s;
  }

  void selectTime(picked, picked_x, type) {
    if (type == "start_time") {
      start_time.value = picked_x;
    } else if (type == "end_time") {
      end_time.value = picked_x;
    }
  }

  Future<void> createTimetable() async {
    clear();
  }

  void clear() {
    error.value = false;
    success.value = false;
    msg.value = "";
  }
}
