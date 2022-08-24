import 'package:grad/app/data/repository/auth/login_repository.dart';
import 'package:get/get.dart';

class VerifyAccountController extends GetxController {
  ///
  /// get argument data
  ///
  dynamic argumentData = Get.arguments;

  var email = "".obs;
  var school = "".obs;

  var loading = false.obs;

  var error = false.obs;

  var error_msg = "".obs;

  var redirect = false.obs;

  var sent = false.obs;

  ///
  /// searching
  ///
  var searching = false.obs;

  @override
  void onInit() {
    email.value = argumentData['email'];
    school.value = argumentData['school'];
    super.onInit();
  }

  Future<void> verify({
    required email,
    required school,
    required code,
  }) async {
    clear();

    loading.value = true;

    if (email == "" || school == "") {
      error.value = true;
      error_msg.value = "Oops, there was an error. Try again later";
    } else if (code == "") {
      error.value = true;
      error_msg.value = "Please, input the 6 digit code sent to your mail";
    } else {
      Map<String, dynamic> data = await LoginRepository.verifyAccount(
        email.toString(),
        school.toString(),
        code.toString(),
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

  void clear() {
    error.value = false;
    loading.value = false;
    error_msg.value = "";
    searching.value = false;
    sent.value = false;
  }

  Future<void> retry({
    required email,
    required school,
  }) async {
    clear();

    searching.value = true;

    if (email == "") {
      error.value = true;
      error_msg.value = "Email or Student Id is required";
    }

    Map<String, dynamic> data = await LoginRepository.recoveryCode(
      email.toString(),
      school.toString(),
    );
    if (data['status']) {
      ///
      /// set redirect after login
      ///
      sent.value = true;
    } else {
      error.value = true;
      error_msg.value = data['message'];
    }

    searching.value = false;
  }
}
