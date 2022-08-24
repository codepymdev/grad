import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/attendance_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';

class StudentAttendance extends GetView<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    var param = Get.arguments;
    return Scaffold(
      appBar: customAppBar(name: "${param['date_human']}"),
      body: GetX<AttendanceController>(
        init: AttendanceController(),
        initState: (_) async {
          await controller.getAtt(date: param['date']);
        },
        builder: (_) {
          if (controller.loading.value)
            return Center(
              child: CircularProgressIndicator(),
            );
          var data = _.student_attendance;
          return Container(
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
          );
        },
      ),
    );
  }

  Widget _buildList(
    data,
    context,
  ) {
    return Column(
      children: [
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
          trailing: data['status'] == "1"
              ? Icon(
                  FeatherIcons.checkCircle,
                  color: Colors.green,
                )
              : Icon(
                  FeatherIcons.xCircle,
                  color: Colors.red[400],
                ),
        ),
        Divider(),
      ],
    );
  }
}
