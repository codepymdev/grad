import 'package:Grad/app/controller/auth/create_account_controller.dart';
import 'package:Grad/app/ui/android/widgets/account/app_version.dart';
import 'package:Grad/app/ui/android/widgets/custom/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CreateAccount extends GetView<CreateAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Center(
            child: Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomNetworkImage(
                    url: "${controller.school['logo']}",
                    wd: 100,
                    ht: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${controller.school['name']}",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "We understand that you don't have an account with us, please contact us directly at the school.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Thank you!",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  ///
                  /// App About and version
                  ///
                  AppAboutVersion(),
                ],
              ),
            ),
          )),
    );
  }
}
