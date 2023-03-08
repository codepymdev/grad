import 'package:Grad/app/controller/home/home_controller.dart';
import 'package:Grad/app/ui/android/widgets/custom/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class School extends GetView<HomeController> {
  const School({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
          margin: EdgeInsets.only(
            left: 5,
            right: 5,
            top: 10,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 10,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${controller.school_data['name']}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.hideSection("school"),
                        child: Icon(
                          controller.hide_school.value
                              ? FeatherIcons.minimize2
                              : FeatherIcons.maximize2,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  if (!controller.hide_school.value)
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CustomNetworkImage(
                                  url: "${controller.school_data['logo']}",
                                  ht: 70,
                                  wd: 70,
                                ),
                                Text(
                                  "${controller.school_data["address"]}",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipOval(
                                        child: CustomNetworkImage(
                                          url:
                                              "${controller.school_data['proprietor_avatar']}",
                                          ht: 50,
                                          wd: 50,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${controller.school_data['proprietor_name']}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              "Proprietress",
                                              style: TextStyle(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipOval(
                                        child: CustomNetworkImage(
                                          url:
                                              "${controller.school_data['principal_avatar']}",
                                          ht: 50,
                                          wd: 50,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${controller.school_data['principal_name']}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              "Principal",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          )),
    );
  }
}
