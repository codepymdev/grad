import 'package:Grad/app/controller/menu/results_controller.dart';
import 'package:get/get.dart';

class ResultsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultsController>(() => ResultsController());
  }
}
