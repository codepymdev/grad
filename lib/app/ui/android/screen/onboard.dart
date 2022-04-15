import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/auth/auth_manager_controller.dart';

import 'package:Grad/app/ui/android/screen/navigation.dart';
import 'package:Grad/app/ui/android/screen/start/welcome.dart';

class OnBoard extends StatefulWidget {
  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  AuthManagerController authManagerController =
      Get.put(AuthManagerController());
  @override
  Widget build(BuildContext context) {
    ///
    /// if not login -> navigation {home screen}
    /// else welcome -- select school
    ///
    return Obx(() {
      if (authManagerController.loading.value) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return authManagerController.isLogin.value ? Navigation() : Welcome();
    });
  }
}
