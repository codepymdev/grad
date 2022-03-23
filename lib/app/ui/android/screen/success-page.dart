import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/others/success-page-controller.dart';
import 'package:grad/app/core/constants/asset_path.dart';

class SuccessPage extends GetView<SuccessPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  PADLOCK,
                  width: 150,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${controller.message}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () => Get.offAndToNamed("/"),
                child: Text(
                  "Go Back",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
