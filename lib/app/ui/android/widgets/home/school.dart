import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/home/home_controller.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';

class School extends GetView<HomeController> {
  const School({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.school_data.isEmpty) {
        return Container();
      }
      return Container(
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
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ));
    });
  }
}
