import 'package:get/state_manager.dart';
import 'package:grad/app/data/repository/start/school_repository.dart';

class WelcomeController extends GetxController {
  var isLoading = true.obs;
  var schoolList = [].obs;
  var selected = 0.obs;
  var hasSelected = false.obs;

  @override
  void onInit() {
    getAllSchools();
    super.onInit();
  }

  void getAllSchools() async {
    isLoading(true);
    List<dynamic>? schools = await SchoolRepository.getSchools();
    if (schools != null) {
      schoolList.value = schools;
    }
    isLoading(false);
  }

  void updateSelected(index) {
    selected.value = index;
    hasSelected.value = true;
  }
}
