import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  ///
  /// get argument data
  ///
  dynamic argumentData = Get.arguments;

  var school = {}.obs;

  @override
  void onInit() {
    school.value = argumentData['school'];
    super.onInit();
  }
}
