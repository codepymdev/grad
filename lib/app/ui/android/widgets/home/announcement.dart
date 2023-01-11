import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/home/home_controller.dart';
import 'package:grad/app/core/constants/asset_path.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Announcement extends GetView<HomeController> {
  const Announcement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var data = controller.current_announcement;
        if (data.isEmpty) return Container();

        return Container(
          margin: EdgeInsets.only(
            left: 5.w,
            right: 5.w,
            top: 5.h,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
                top: 10.h,
                bottom: 10.h,
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
                            width: 30.w,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "${data['type']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () => controller.hideSection("announcement"),
                        child: Icon(
                          controller.hide_announcement.value
                              ? FeatherIcons.minimize2
                              : FeatherIcons.maximize2,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  if (!controller.hide_announcement.value)
                    Container(
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Color(0xffF94892),
                      ),
                      child: Text(
                        "${data['message']}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
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
