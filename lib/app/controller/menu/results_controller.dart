import 'dart:isolate';
import 'dart:ui';

import 'package:Grad/app/core/constants/api_constants.dart';
import 'package:Grad/app/core/constants/app_constants.dart';
import 'package:Grad/app/core/functions/functions.dart';
import 'package:Grad/app/data/mixins/cache_manager.dart';
import 'package:Grad/app/data/model/class_model.dart';
import 'package:Grad/app/data/repository/menu/people_repository.dart';
import 'package:Grad/app/data/repository/menu/result_repository.dart';
import 'package:Grad/app/data/repository/settings/settings_repository.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';

import 'dart:io' show Directory, Platform;

class ResultsController extends GetxController with CacheManager {
  dynamic params = Get.arguments;

  var loading = true.obs;

  var school = "".obs;

  /// campus
  var campus_ = "".obs;

  /// user role
  var r = "".obs;

  var classId = "".obs;

  var classes = [].obs;
  Rxn<ClasssModel> classes_value = Rxn<ClasssModel>();

  var students = [].obs;

  var processing = false.obs;

  late String tval;
  late String yval;

  var configs = [].obs;

  var error = false.obs;
  var error_msg = "".obs;

  var success = false.obs;
  var success_msg = "".obs;

  String? _localPath;

  String resultFile = "";

  var termValue = "".obs;
  var yearValue = "".obs;

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

    if (params['handler'] == "students") {
      classId.value = params['classId'];
      await getClassStudents(classId);
    }

    configs.value = await SettingsRepository.getConfigSettings(
      school: school.value,
    );
    tval = getConfigValue(configs, "term");
    yval = getConfigValue(configs, "year");

    if (tval == "1") {
      termValue.value = "First Term";
    } else if (tval == "2") {
      termValue.value = "Second Term";
    } else {
      termValue.value = "Third Term";
    }
    yearValue.value = getConfigValue(configs, "year");

    //get classes
    List<ClasssModel> _class = await ResultRepository.getClasses(
      school: school.value,
      campus: campus_.value,
      r: r.value,
    );

    classes.value = _class;

    FlutterDownloader.registerCallback(downloadCallback);
    loading.value = false;
    super.onInit();
  }

  Future<void> getResult(id) async {
    clear();
    loading.value = true;

    var response = await ResultRepository.currentResult(data: {
      "school": school.value,
      "classId": classId.value,
      "campusId": campus_.value,
      "term": tval,
      "year": yval,
      "userId": id,
    });

    if (response['status']) {
      resultFile = response['file'];
      success.value = true;
      success_msg.value = response['message'];
    } else {
      error.value = true;
      error_msg.value = response['message'];
    }

    loading.value = false;
  }

  Future<void> getClassStudents(id) async {
    loading.value = true;

    ///
    ///update classId
    List<dynamic> _data = await PeopleRepository.getClassStudents(
      school: school.value,
      classId: id,
      per_page: PER_PAGE,
      page: PAGE,
    );
    students.value = _data;
    loading.value = false;
  }

  Future<void> getPastResult(id) async {
    clear();
    processing.value = true;
    String term;
    if (termValue.value == "First Term") {
      term = "1";
    } else if (termValue.value == "Second Term") {
      term = "2";
    } else {
      term = "3";
    }
    var response = await ResultRepository.currentResult(data: {
      "school": school.value,
      "classId": classes_value.value != null ? classes_value.value!.id : "0",
      "campusId": campus_.value,
      "term": term,
      "year": yearValue.value,
      "userId": id,
    });

    if (response['status']) {
      resultFile = response['file'];
      success.value = true;
      success_msg.value = response['message'];
    } else {
      error.value = true;
      error_msg.value = response['message'];
    }

    processing.value = false;
  }

  Future<void> loadfile() async {
    _localPath = (await findLocalPath())! + Platform.pathSeparator + 'Download';

    final savedDir = Directory(_localPath!);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    String _url = gradUrl + resultFile;
    await FlutterDownloader.enqueue(
      url: _url,
      savedDir: _localPath!,
      showNotification: true,
      openFileFromNotification: true,
    );
  }

  void clear() {
    error.value = false;
    error_msg.value = "";
    success.value = false;
    success_msg.value = "";
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  void updateTermDropDown(value) {
    termValue.value = value;
  }

  void updateYearDropDown(value) {
    yearValue.value = value;
  }

  void updateClassState(ClasssModel x) {
    classes_value.value = x;
  }
}
