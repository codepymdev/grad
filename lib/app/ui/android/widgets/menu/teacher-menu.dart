import 'package:Grad/app/core/constants/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TeacherMenu extends StatelessWidget {
  const TeacherMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      children: [
        GestureDetector(
          onTap: () => Get.toNamed("/classes"),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  CLASS,
                  width: 60,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Classes",
                ),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () => Get.toNamed("/subjects"),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  BOOKS,
                  width: 60,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Subjects",
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed("/class-students"),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  STUDENT,
                  width: 60,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Students",
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(
            "/parents",
            arguments: {
              "handler": "parents",
            },
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  PARENT,
                  width: 60,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Parents",
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(
            "/staffs",
            arguments: {
              "handler": "staffs",
            },
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  TEACHER,
                  width: 60,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Staffs",
                ),
              ],
            ),
          ),
        ),
        // Container(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       SvgPicture.asset(
        //         QUIZ,
        //         width: 60,
        //       ),
        //       SizedBox(
        //         height: 8,
        //       ),
        //       Text(
        //         "CBT",
        //         style: Theme.of(context).textTheme.subtitle1,
        //       ),
        //     ],
        //   ),
        // ),
        Container(
          child: GestureDetector(
            onTap: () => Get.toNamed("/attendance"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  TIMESHEETS,
                  width: 60,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Attendance",
                ),
              ],
            ),
          ),
        ),
        Container(
          child: GestureDetector(
            onTap: () => Get.toNamed("/results"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  EXAM,
                  width: 60,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Results",
                ),
              ],
            ),
          ),
        ),
        // Container(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       SvgPicture.asset(
        //         REPORT,
        //         width: 60,
        //       ),
        //       SizedBox(
        //         height: 8,
        //       ),
        //       Text(
        //         "Reports",
        //         style: Theme.of(context).textTheme.subtitle1,
        //       ),
        //     ],
        //   ),
        // ),
        GestureDetector(
          onTap: () => Get.toNamed(
            "/users",
            arguments: {
              "handler": "users",
            },
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  USERS,
                  width: 60,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Users",
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed("/announcements"),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ANNOUNCEMENT,
                  width: 60,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Announcement",
                ),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () => Get.toNamed("/calendar"),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  CALENDAR,
                  width: 60,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Calendar",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
