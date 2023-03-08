import 'package:Grad/app/core/constants/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StudentMenu extends StatelessWidget {
  const StudentMenu({
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
          onTap: () => Get.toNamed("/student-class"),
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
                  "My Class",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed("/student-subject"),
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
                  "My Subjects",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed("/students/classmates"),
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
                  "Class Mates",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(
            "/parents/myparent",
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
                  "My Parents",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(
            "/staffs/myteacher",
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
                  "My Teachers",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
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
                  style: Theme.of(context).textTheme.subtitle1,
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
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
