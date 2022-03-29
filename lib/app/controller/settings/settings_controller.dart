import 'dart:io';

import 'package:get/get.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/repository/settings/settings_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SettingsController extends GetxController with CacheManager {
  var configs = [].obs;
  var school = "".obs;

  var loading = true.obs;

  var processing = false.obs;

  var error = false.obs;
  var error_msg = "".obs;

  var success = false.obs;
  var success_msg = "".obs;

  var termValue = "".obs;
  var yearValue = "".obs;

  Rxn<DateTime> initial_date = Rxn<DateTime>();

  var next_term_begins = "".obs;
  var term_ends = "".obs;
  var term_begins = "".obs;
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  var picked = false.obs;

  Rxn<String> stamp = Rxn<String>();
  File? uploadStamp = null;
  var uploadStampFile = "";

  var app_notifications_settings = {}.obs;

  @override
  void onInit() async {
    String? _school = await getSchool();
    if (_school != null) {
      school.value = _school;
    }
    configs.value = await SettingsRepository.getConfigSettings(
      school: school.value,
    );

    String tval = getConfigValue(configs, "term");
    if (tval == "1") {
      termValue.value = "First Term";
    } else if (tval == "2") {
      termValue.value = "Second Term";
    } else {
      termValue.value = "Third Term";
    }
    yearValue.value = getConfigValue(configs, "year");

    term_begins.value = dateFormat
        .format(DateTime.parse(getConfigValue(configs, "term_begins")));
    term_ends.value =
        dateFormat.format(DateTime.parse(getConfigValue(configs, "term_ends")));
    next_term_begins.value = dateFormat
        .format(DateTime.parse(getConfigValue(configs, "next_term_begins")));
    initial_date.value = DateTime.now();

    stamp.value = getConfigValue(configs, "school_signature");

    ///
    /// init notification settings
    ///
    app_notifications_settings.value = {
      "app": true,
      "announcement": true,
      "email": true,
      "sms": true,
    };

    ///
    /// Notification settings
    ///
    dynamic _notification_settings = await getNotificationSettings();
    if (_notification_settings != null)
      app_notifications_settings = _notification_settings;

    loading.value = false;
    super.onInit();
  }

  ///
  /// update school config
  ///
  Future<void> updateSchoolConfig({
    required data,
  }) async {
    clear();
    processing.value = true;
    //add school to the map
    data["school"] = school.value;
    Map<String, dynamic> response = await SettingsRepository.updateSchoolConfig(
      data: data,
    );

    if (response['status']) {
      success.value = true;
      success_msg.value = "Updated";
    } else {
      error.value = true;
      error_msg.value = response['message'];
    }

    processing.value = false;
  }

  ///
  /// update Session
  ///
  Future<void> updateSession() async {
    clear();
    processing.value = true;

    //add school to the map
    Map<String, dynamic> data = {
      "school": school.value,
      "term": termValue.value,
      "year": yearValue.value,
    };
    Map<String, dynamic> response = await SettingsRepository.updateSession(
      data: data,
    );

    if (response['status']) {
      success.value = true;
      success_msg.value = "Updated";
    } else {
      error.value = true;
      error_msg.value = response['message'];
    }

    processing.value = false;
  }

  ///
  /// update term
  ///
  Future<void> updateTerm() async {
    clear();

    processing.value = true;

    //add school to the map
    Map<String, dynamic> data = {
      "school": school.value,
      "term_begins": term_begins.value,
      "term_ends": term_ends.value,
      "next_term_begins": next_term_begins.value,
    };
    Map<String, dynamic> response = await SettingsRepository.updateTerm(
      data: data,
    );

    if (response['status']) {
      success.value = true;
      success_msg.value = "Updated";
    } else {
      error.value = true;
      error_msg.value = response['message'];
    }

    processing.value = false;
  }

  void clear() {
    success.value = false;
    success_msg.value = "";

    error.value = false;
    error_msg.value = "";
  }

  void selectDate(picked, type) {
    if (type == "next_term") {
      next_term_begins.value = dateFormat.format(picked);
    } else if (type == "term_end") {
      term_ends.value = dateFormat.format(picked);
    } else if (type == "term_begins") {
      term_begins.value = dateFormat.format(picked);
    }
  }

  Future<void> fetchImageFile() async {
    clear();
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500.0,
      maxHeight: 500.0,
      imageQuality: 50,
    );
    if (image != null) {
      uploadStamp = File(image.path);
      uploadStampFile = image.path;
    }

    //add school to the map
    Map<String, dynamic> data = {
      "school": school.value,
      "image": uploadStampFile,
    };
    processing.value = true;

    Map<String, dynamic> response = await SettingsRepository.updateStamp(data);
    if (response['status']) {
      //save token
      success_msg.value = "Updated";
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
    picked.value = true;
    processing.value = false;
  }

  void updateNotification(type, val) async {
    app_notifications_settings[type] = val;
    await updateNotificationSettings(app_notifications_settings);
  }

  Future<void> submitBugIssue({required data}) async {
    processing.value = true;
    clear();

    if (data['name'] == "") {
      error.value = true;
      error_msg.value = "Please! tell us the type of bug you are having";
    } else if (data['note'] == "") {
      error.value = true;
      error_msg.value = "Please! write a note on the bug.";
    } else {
      //add school to the map
      data["school"] = school.value;
      Map<String, dynamic> response = await SettingsRepository.submitBugIssue(
        data: data,
      );

      if (response['status']) {
        success.value = true;
        success_msg.value =
            "Thank you for the reporting the issue to us! It will be fixed as soon as possible";
      } else {
        error.value = true;
        error_msg.value = response['message'];
      }
    }

    processing.value = false;
  }

  void updateTermDropDown(value) {
    termValue.value = value;
  }

  void updateYearDropDown(value) {
    yearValue.value = value;
  }
}
