import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/attendance_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class ViewAttendance extends StatefulWidget {
  @override
  State<ViewAttendance> createState() => _ViewAttendanceState();
}

class _ViewAttendanceState extends State<ViewAttendance> {
  AttendanceController attendanceController = Get.put(AttendanceController());
  @override
  Widget build(BuildContext context) {
    final param = Get.arguments;
    return Scaffold(
      appBar: customAppBar(
        name: "${param['classname']} ${param['classarm']}",
        type: "attendance",
      ),
      body: Obx(
        () {
          if (attendanceController.loading.value)
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          var attendance = attendanceController.attendance;

          return Container(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: attendance.length,
              separatorBuilder: (_, i) => Divider(),
              itemBuilder: (_, i) {
                return ListTile(
                  onTap: () => Get.toNamed("/student/attendance", arguments: {
                    "date_human": convertToDate(attendance[i]['date']),
                    "date": attendance[i]['date'],
                  }),
                  title: Text(
                    "${convertToDate(attendance[i]['date'])}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    FeatherIcons.chevronRight,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
