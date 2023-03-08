import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/menu/attendance_controller.dart';
import 'package:Grad/app/core/functions/functions.dart';
import 'package:Grad/app/ui/android/widgets/custom/cached_network_image.dart';
import 'package:Grad/app/ui/android/widgets/form/attendance/attendance_date.dart';

class AddAttendance extends GetView<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Add Attendance"),
      body: SingleChildScrollView(
        child: Obx(() {
          if (controller.loading.value)
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          var data = controller.students;
          return Column(
            children: [
              AttendanceDate(),
              Container(
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    for (var i = 0; i < data.length; i++)
                      _buildList(
                        data[i],
                        context,
                      ),
                  ],
                ),
              ),
              //submite button
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 30,
                ),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(),
                  child: controller.processing.value
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          "Save",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  onPressed: () async {
                    if (!controller.processing.value) {
                      await controller.addStudentAttendance();
                      if (controller.error.value) {
                        final snackBar = SnackBar(
                          content: Text('${controller.error_msg.value}'),
                          backgroundColor: Colors.red,
                        );
                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      if (controller.success.value) {
                        final snackBar = SnackBar(
                          content: Text('${controller.success_msg.value}'),
                          backgroundColor: Colors.green,
                        );
                        // Find the ScaffoldMessenger in the widget tree
                        // and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Get.back();
                      }
                    }
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildList(
    data,
    context,
  ) {
    bool isChecked = false;
    //check if id is in attendance
    List<dynamic> attendance = controller.attendance_list;
    if (attendance.contains(data['student']['id'])) isChecked = true;
    return Column(
      children: [
        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        ListTile(
          leading: ClipOval(
            child: CustomNetworkImage(
              url: "${data['student']['avatar']}",
            ),
          ),
          title: Text(
            "${data['student']['first_name']} ${data['student']['last_name']} ${data['student']['middle_name'] ?? ""}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "${data['student']['reg_no']}",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          trailing: Checkbox(
            value: isChecked,
            onChanged: (value) {
              if (value!) {
                controller.addAttendance(data['student']['id']);
              } else {
                controller.removeAttendance(data['student']['id']);
              }
            },
          ),
        ),

        Divider(),
      ],
    );
  }
}
