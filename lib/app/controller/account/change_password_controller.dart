import 'package:Grad/app/data/mixins/cache_manager.dart';
import 'package:Grad/app/data/repository/account/profile_repository.dart';
import 'package:get/get.dart';

class ChangePasswordAccountController extends GetxController with CacheManager {
  var loading = false.obs;

  ///
  /// toggle of the password
  ///
  var toggleOff = true.obs;
  var toggleOff2 = true.obs;

  var userid = "".obs;
  var school = "".obs;

  var error = false.obs;

  var error_msg = "".obs;

  var success = false.obs;

  var success_msg = "".obs;

  var redirect = false.obs;

  @override
  void onInit() async {
    Map<String, dynamic>? data = await getMe();
    if (data != null) {
      userid.value = data['id'];
    }
    String? _school = await getSchool();
    if (_school != null) {
      school.value = _school;
    }
    super.onInit();
  }

  Future<void> change({
    required password,
    required confirm_password,
  }) async {
    clear();

    loading.value = true;

    if (userid.value == "" || school.value == "") {
      error.value = true;
      error_msg.value = "Oops, there was an error. Try again later";
    } else if (password == "" || confirm_password == "") {
      error.value = true;
      error_msg.value = "Password is required";
    } else if (password != confirm_password) {
      error.value = true;
      error_msg.value = "Both Password must match";
    } else {
      Map<String, dynamic> data = await ProfileRepository.changePassword(
        password: password,
        confirm_password: confirm_password,
        userid: userid.value,
        school: school.value,
      );

      if (data['status']) {
        ///
        /// set redirect after login
        ///
        redirect.value = true;
      } else {
        error.value = true;
        error_msg.value = data['message'];
      }
    }

    loading.value = false;
  }

  ///
  ///clear
  ///
  void clear() {
    error.value = false;
    loading.value = false;
    error_msg.value = "";
  }

  void toggle() {
    if (toggleOff.value) {
      toggleOff.value = false;
    } else {
      toggleOff.value = true;
    }
  }

  void toggle2() {
    if (toggleOff2.value) {
      toggleOff2.value = false;
    } else {
      toggleOff2.value = true;
    }
  }
}
