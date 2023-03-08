import 'package:Grad/app/data/mixins/cache_manager.dart';
import 'package:Grad/app/data/repository/menu/announcement_repository.dart';
import 'package:get/get.dart';

class AnnouncementController extends GetxController with CacheManager {
  var loading = true.obs;
  var school = "".obs;
  var type = "General Announcement".obs;

  var processing = false.obs;

  var error = false.obs;
  var error_msg = "".obs;

  var success = false.obs;
  var success_msg = "".obs;

  var announcements = [].obs;

  @override
  void onInit() async {
    String? _school = await getSchool();
    if (_school != null) {
      school.value = _school;
    }

    await getAnnouncements();
    loading.value = false;
    super.onInit();
  }

  void updateType(String value) {
    type.value = value;
  }

  Future<void> createAnnouncement({
    required message,
  }) async {
    clear();
    processing.value = true;
    Map<String, dynamic> response =
        await AnnouncementRepository.createAnnouncement(
      data: {
        "school": school.value,
        "message": message,
        "type": type.value,
      },
    );

    if (response['status']) {
      success.value = true;
      success_msg.value = "Announcement successfully created";
    } else {
      error.value = true;
      error_msg.value = response['message'];
    }
    processing.value = false;
  }

  Future<void> getAnnouncements() async {
    List<dynamic> response = await AnnouncementRepository.announcements(
      school: school.value,
      per_page: 10,
      page: 1,
    );
    announcements.value = response;
  }

  void clear() {
    error.value = false;
    error_msg.value = "";
    success.value = false;
    success_msg.value = "";
  }

  Future<void> edit({
    required id,
    required message,
  }) async {
    clear();
    processing.value = true;
    Map<String, dynamic> response =
        await AnnouncementRepository.editAnnouncement(
      data: {
        "school": school.value,
        "message": message,
        "type": type.value,
        "id": id,
      },
    );

    if (response['status']) {
      success.value = true;
      success_msg.value = "Announcement successfully updated";
    } else {
      error.value = true;
      error_msg.value = response['message'];
    }
    processing.value = false;
  }

  Future<void> delete(id) async {
    loading.value = true;
    Map<String, dynamic> response = await AnnouncementRepository.delete(
      school: school.value,
      id: id,
    );
    await getAnnouncements();
    if (response['status']) {
      success.value = true;
      success_msg.value = "Announcement successfully deleted";
    } else {
      error.value = true;
      error_msg.value = response['message'];
    }
    loading.value = false;
  }

  Future<void> pin(id) async {
    loading.value = true;

    Map<String, dynamic> response = await AnnouncementRepository.pin(data: {
      "school": school.value,
      "id": id,
    });
    await getAnnouncements();
    if (response['status']) {
      success.value = true;
      success_msg.value = "Announcement successfully pinned";
    } else {
      error.value = true;
      error_msg.value = response['message'];
    }
    loading.value = false;
  }

  Future<void> unpin(id) async {
    loading.value = true;
    Map<String, dynamic> response = await AnnouncementRepository.unpin(data: {
      "school": school.value,
      "id": id,
    });
    await getAnnouncements();
    if (response['status']) {
      success.value = true;
      success_msg.value = "Announcement successfully unpinned";
    } else {
      error.value = true;
      error_msg.value = response['message'];
    }
    loading.value = false;
  }
}
