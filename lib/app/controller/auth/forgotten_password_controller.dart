import 'package:Grad/app/data/repository/auth/login_repository.dart';
import 'package:get/get.dart';

class ForgottenPassowrdController extends GetxController {
  ///
  /// get argument data
  ///
  dynamic argumentData = Get.arguments;

  ///
  /// searching
  ///
  var searching = false.obs;

  var school = {}.obs;

  var error = false.obs;

  var error_msg = "".obs;

  var redirect = false.obs;
  @override
  void onInit() {
    school.value = argumentData['school'];
    super.onInit();
  }

  Future<void> search({
    required email,
    required school,
  }) async {
    clear();

    searching.value = true;

    if (email == "") {
      error.value = true;
      error_msg.value = "Email or Student Id is required";
    } else {
      Map<String, dynamic> data = await LoginRepository.recoveryCode(
        email.toString(),
        school.toString(),
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

    searching.value = false;
  }

  ///
  ///clear
  ///
  void clear() {
    error.value = false;
    searching.value = false;
    error_msg.value = "";
  }
}
