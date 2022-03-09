import 'package:get/get.dart';

class LoginController extends GetxController {
  ///
  /// get argument data
  ///
  dynamic argumentData = Get.arguments;

  ///
  /// toggle of the password
  ///
  var toggleOff = true.obs;

  ///
  /// login loader
  ///
  var loginLoader = false.obs;

  ///
  /// school map
  ///
  var school = {}.obs;

  ///
  /// email & password
  ///
  var passworderror = false.obs;
  var password_msg = "".obs;
  var emailerror = false.obs;
  var email_msg = "".obs;
  var error = false.obs;
  var error_msg = "".obs;

  @override
  void onInit() {
    school.value = argumentData['school'];
    super.onInit();
  }

  void toggle() {
    if (toggleOff.value) {
      toggleOff.value = false;
    } else {
      toggleOff.value = true;
    }
  }

  void login({
    required email,
    required password,
    required school,
  }) {
    clear();

    loginLoader.value = true;
    if (email == "") {
      emailerror.value = true;
      email_msg.value = "Email or Student Id is required";
    }
    if (password == "") {
      passworderror.value = true;
      password_msg.value = "Password is required";
    }
    if (school == "") {
      error.value = true;
      error_msg.value = "Oops, there was an error!";
    }
    loginLoader.value = false;
  }

  ///
  ///clear
  ///
  void clear() {
    emailerror.value = false;
    passworderror.value = false;
    error.value = false;
    loginLoader.value = false;
    error_msg.value = "";
    password_msg.value = "";
    email_msg.value = "";
  }
}
