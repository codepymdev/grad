import 'package:grad/app/controller/home/home_controller.dart';
import 'package:grad/app/core/constants/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Announcement extends StatefulWidget {
  const Announcement({
    Key? key,
  }) : super(key: key);

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var data = homeController.current_announcement;
        if (data.isEmpty) return Container();

        return Container(
          margin: EdgeInsets.only(
            left: 5,
            right: 5,
            top: 5,
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            ANNOUNCEMENT,
                            width: 30,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${data['type']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () => homeController.hideSection("announcement"),
                        child: Icon(
                          homeController.hide_announcement.value
                              ? FeatherIcons.minimize2
                              : FeatherIcons.maximize2,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  if (!homeController.hide_announcement.value)
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffF94892),
                      ),
                      child: Text(
                        "${data['message']}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
