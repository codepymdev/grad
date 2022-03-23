import 'dart:io';

import 'package:get/get.dart';
import 'package:grad/app/controller/auth/auth_manager_controller.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/repository/account/profile_repository.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController with CacheManager {
  var user = {};
  var school = "";
  var userid = "";

  var loading = true;
  var processing = false;

  var picked = false;

  File? imageFile = null;

  var uploadImage = "";

  var gender = "Select gender";

  var error = false.obs;

  var error_msg = "".obs;

  var success = false.obs;
  var success_msg = "".obs;

  @override
  void onInit() async {
    await getUserData();
    loading = false;
    gender = user["gender"] == "" ? "Select gender" : user['gender'];
    school = user['school'];
    userid = user['id'];
    update();
    super.onInit();
  }

  void updateGenderState(String g) {
    gender = g;
    update();
  }

  Future<void> getUserData() async {
    Map<String, dynamic>? data = await getMe();
    if (data != null) {
      user = data;
    }
    String? _school = await getSchool();
    if (_school != null) {
      school = _school;
    }
  }

  Future<void> fetchImageFile() async {
    picked = true;
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500.0,
      maxHeight: 500.0,
      imageQuality: 50,
    );
    if (image != null) {
      imageFile = File(image.path);
      uploadImage = image.path;
    }
    update();
  }

  Future<void> updateProfile({required data}) async {
    clear();
    Map<String, dynamic> _data = {
      "image": uploadImage,
      "school": school,
      "id": userid,
    };
    _data.addAll(data);
    Map<String, dynamic> response =
        await ProfileRepository.updateProfile(_data);

    if (response['status']) {
      //save token
      AuthManagerController().login(response['data']);
      success_msg.value = "Account successfully updated";
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
    processing = false;
    update();
  }

  void setLoader() {
    processing = true;
    update();
  }

  void clear() {
    error_msg.value = "";
    error.value = false;
    success.value = false;
    success_msg.value = "";
  }
}
