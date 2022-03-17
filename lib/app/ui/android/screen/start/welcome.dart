import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/start/welcome_controller.dart';
import 'package:grad/app/ui/android/widgets/account/app_version.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';

class Welcome extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 50,
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Select your school".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return Column(
                            children: [
                              Container(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  separatorBuilder: (_, index) => Divider(),
                                  itemCount: controller.schoolList.length,
                                  itemBuilder: (_, index) {
                                    return SchoolTile(
                                      school: controller.schoolList[index],
                                      index: index,
                                    );
                                  },
                                ),
                              ),

                              ///
                              /// App About and version
                              ///
                              AppAboutVersion(),
                            ],
                          );
                        }
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            left: 10,
            bottom: 10,
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Grad v.1.0",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Obx(() {
                return ElevatedButton(
                  onPressed: () => controller.hasSelected.value
                      ? Get.toNamed("/login", arguments: {
                          "school":
                              controller.schoolList[controller.selected.value]
                        })
                      : null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      controller.hasSelected.value
                          ? Color.fromARGB(255, 106, 74, 248)
                          : Color.fromARGB(255, 160, 142, 243),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text("Go"),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class SchoolTile extends GetView<WelcomeController> {
  const SchoolTile({
    Key? key,
    required this.school,
    required this.index,
  }) : super(key: key);

  final Map<String, dynamic> school;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Ink(
        color: !controller.hasSelected.value
            ? null
            : index == controller.selected.value
                ? Color.fromARGB(255, 203, 216, 248)
                : null,
        child: ListTile(
          leading: ClipOval(
            child: CustomNetworkImage(
              url: "${school['logo']}",
              wd: 25,
              ht: 25,
            ),
          ),
          title: Text("${school['name']}"),
          onTap: () => controller.updateSelected(index),
        ),
      ),
    );
  }
}
