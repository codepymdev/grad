import 'package:grad/app/controller/auth/auth_manager_controller.dart';
import 'package:grad/app/data/mixins/cache_manager.dart';
import 'package:grad/app/data/repository/auth/login_repository.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController with CacheManager {
  var loading = false.obs;

  ///
  /// toggle of the password
  ///
  var toggleOff = true.obs;
  var toggleOff2 = true.obs;

  ///
  /// get argument data
  ///
  dynamic argumentData = Get.arguments;

  var school = "".obs;
  var email = "".obs;

  var error = false.obs;

  var error_msg = "".obs;

  var redirect = false.obs;

  @override
  void onInit() {
    school.value = argumentData['school'].toString();
    email.value = argumentData['email'].toString();
    super.onInit();
  }

  Future<void> change({
    required password,
    required confirm_password,
  }) async {
    clear();

    loading.value = true;

    if (email.value == "" || school.value == "") {
      error.value = true;
      error_msg.value = "Oops, there was an error. Try again later";
    } else if (password == "" || confirm_password == "") {
      error.value = true;
      error_msg.value = "Password is required";
    } else if (password != confirm_password) {
      error.value = true;
      error_msg.value = "Both Password must match";
    } else {
      Map<String, dynamic> data = await LoginRepository.changePassword(
        password: password,
        confirm_password: confirm_password,
        email: email.value,
        school: school.value,
      );

      if (data['status']) {
        //save token
        AuthManagerController().login(data['data']);

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
