import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/attendance_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class ViewAttendance extends GetView<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    final param = Get.arguments;
    return Scaffold(
      appBar: customAppBar(
          "${param['studentName']} - ${param['classname']} ${param['classarm']}"),
      body: Obx(
        () {
          if (controller.loading.value)
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          return Container(
            child: Text("Attendance here"),
          );
        },
      ),
    );
  }
}
