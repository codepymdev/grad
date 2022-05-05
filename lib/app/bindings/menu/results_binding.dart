import 'package:get/get.dart';
import 'package:grad/app/controller/menu/results_controller.dart';

class ResultsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultsController>(() => ResultsController());
  }
}
