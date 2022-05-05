import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/users_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';

class StudentResults extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    final param = Get.arguments;
    return Scaffold(
      appBar: customAppBar("${param['classname']} ${param['classarm']}"),
      body: Obx(() {
        if (controller.loading.value)
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        var data = controller.students;

        if (data.length == 0)
          return Center(
            child: Text("No Students"),
          );
        return Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (var i = 0; i < data.length; i++)
                _buildList(
                  data[i],
                  context,
                  param,
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildList(
    data,
    context,
    param,
  ) {
    param['handler'] = "student";
    param['id'] = data['student']['id'];
    param['studentId'] = data['student']['id'];
    param['studentName'] =
        data['student']['first_name'] + ' ' + data['student']['last_name'];
    return Column(
      children: [
        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        ListTile(
          onTap: () => Get.toNamed(
            "/results/view",
            arguments: param,
          ),
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
          trailing: userStatusIcon("${data['student']['status']}"),
        ),

        Divider(),
      ],
    );
  }
}
