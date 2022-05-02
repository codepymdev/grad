import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/auth/auth_manager_controller.dart';

import 'package:grad/app/ui/android/screen/navigation.dart';
import 'package:grad/app/ui/android/screen/start/welcome.dart';

class OnBoard extends GetView<AuthManagerController> {
  @override
  Widget build(BuildContext context) {
    ///
    /// if not login -> navigation {home screen}
    /// else welcome -- select school
    ///
    return Obx(() {
      if (controller.loading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return controller.isLogin.value ? Navigation() : Welcome();
    });
  }
}
