import 'package:get/get.dart';

class SuccessPageController extends GetxController {
  ///
  /// get argument data
  ///
  dynamic argumentData = Get.arguments;
  var type = "".obs;
  var message = "".obs;

  @override
  void onInit() {
    type.value = argumentData['type'].toString();
    message.value = argumentData['message'].toString();
    super.onInit();
  }
}
