import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/settings/settings_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';
import 'package:grad/app/ui/android/widgets/custom/ios_loader.dart';

class Stamp extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Stamp"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
            bottom: 15,
          ),
          child: Obx(() {
            if (controller.loading.value)
              return Center(
                child: CircularProgressIndicator(),
              );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    left: 2,
                  ),
                  child: Text(
                    "Upload stamp/signature",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  child: controller.picked.value
                      ? controller.stamp == ""
                          ? CustomNetworkImage(
                              url: "${controller.stamp}",
                              ht: 100,
                              wd: 100,
                            )
                          : Image.file(
                              controller.uploadStamp!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                      : CustomNetworkImage(
                          url: "${controller.stamp}",
                          ht: 100,
                          wd: 100,
                        ),
                ),
                //save
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: controller.processing.value
                        ? IosLoader()
                        : Text(
                            "Update Stamp/Signature",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                    onPressed: () async {
                      if (!controller.processing.value) {
                        await controller.fetchImageFile();
                        if (controller.error.value) {
                          final snackBar = SnackBar(
                            content: Text('${controller.error_msg.value}'),
                            backgroundColor: Colors.red,
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        if (controller.success.value) {
                          final snackBar = SnackBar(
                            content: Text('${controller.success_msg.value}'),
                            backgroundColor: Colors.green,
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
