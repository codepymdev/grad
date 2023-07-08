import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/settings/settings_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';

class Stamp extends StatefulWidget {
  @override
  State<Stamp> createState() => _StampState();
}

class _StampState extends State<Stamp> {
  SettingsController settingsController = Get.put(SettingsController());
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
            if (settingsController.loading.value)
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
                  child: settingsController.picked.value
                      ? settingsController.stamp == ""
                          ? CustomNetworkImage(
                              url: "${settingsController.stamp}",
                              ht: 100,
                              wd: 100,
                            )
                          : Image.file(
                              settingsController.uploadStamp!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                      : CustomNetworkImage(
                          url: "${settingsController.stamp}",
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
                  child: ElevatedButton(
                    style: ButtonStyle(),
                    child: settingsController.processing.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            "Update Stamp/Signature",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    onPressed: () async {
                      if (!settingsController.processing.value) {
                        await settingsController.fetchImageFile();
                        if (settingsController.error.value) {
                          final snackBar = SnackBar(
                            content:
                                Text('${settingsController.error_msg.value}'),
                            backgroundColor: Colors.red,
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        if (settingsController.success.value) {
                          final snackBar = SnackBar(
                            content:
                                Text('${settingsController.success_msg.value}'),
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
