import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/auth/auth_manager_controller.dart';

import 'package:grad/app/ui/android/screen/navigation.dart';
import 'package:grad/app/ui/android/screen/start/welcome.dart';
import 'package:grad/app/ui/android/widgets/custom/ios_loader.dart';

class OnBoard extends GetView<AuthManagerController> {
  @override
  Widget build(BuildContext context) {
    ///
    /// if not login -> navigation {home screen}
    /// else welcome -- select school
    ///
    return Obx(() {
      if (controller.loading.value) {
        return Scaffold(
          body: IosLoader(),
        );
      }
      return controller.isLogin.value ? Navigation() : Welcome();
    });
  }
}
