import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/home/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  HomeController homecontroller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Obx(() {
          ///
          /// user data
          ///
          var user = homecontroller.user;
          if (user.isEmpty) return Container();
          return ListView(
            children: [
              DrawerHeader(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      ClipOval(
                        child: CustomNetworkImage(
                          url: user['avatar'],
                          wd: 80.w,
                          ht: 80.h,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 10.w,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    Text(
                                      "${greetings()['greeting']}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SvgPicture.asset(
                                      "${greetings()['icon']}",
                                      width: 30.w,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "${user['first_name']} ${user['last_name']}",
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  user['type'] == 'student'
                                      ? "${user['reg_no']}"
                                      : "${user['email']}",
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 5,
                ),
                child: Text(
                  "CLASS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(FeatherIcons.airplay),
                title: Text("Add Class"),
              ),
              ListTile(
                leading: Icon(FeatherIcons.activity),
                title: Text("Manage Class"),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.only(
                  left: 5,
                ),
                child: Text(
                  "Subjects",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(FeatherIcons.airplay),
                title: Text("Add Subject"),
              ),
              ListTile(
                leading: Icon(FeatherIcons.activity),
                title: Text("Manage Subjects"),
              ),
              Divider(),
            ],
          );
        }),
      ),
    );
  }
}
