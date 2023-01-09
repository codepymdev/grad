import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/start/welcome_controller.dart';
import 'package:grad/app/ui/android/widgets/account/app_version.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad/app/ui/android/widgets/custom/ios_loader.dart';

class Welcome extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 50.h,
                  left: 10.w,
                  right: 10.w,
                  bottom: 10.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Select your school".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return Container(
                          child: IosLoader(),
                        );
                      }
                      var schools = controller.schoolList;

                      return Column(
                        children: [
                          Container(
                            child: ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (_, index) => Divider(),
                              itemCount: schools.length,
                              itemBuilder: (_, index) {
                                return SchoolTile(
                                  school: schools[index],
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
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 10.w,
          bottom: 10.h,
          right: 10.w,
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
                        ? Colors.green
                        : Color.fromARGB(255, 143, 239, 146),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Go",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }),
          ],
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
    print(school['logo']);
    return Obx(
      () => Ink(
        color: !controller.hasSelected.value
            ? null
            : index == controller.selected.value
                ? Color.fromARGB(255, 166, 241, 168)
                : null,
        child: ListTile(
          leading: ClipOval(
            child: school['logo'] == null
                ? Image.asset(
                    "assets/images/logo/logo.png",
                    width: 25.w,
                    height: 25.h,
                  )
                : CustomNetworkImage(
                    url: "${school['logo']}",
                    wd: 25.w,
                    ht: 25.h,
                  ),
          ),
          title: Text("${school['name']}"),
          onTap: () => controller.updateSelected(index),
        ),
      ),
    );
  }
}
