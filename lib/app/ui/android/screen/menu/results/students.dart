import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/menu/results_controller.dart';
import 'package:Grad/app/core/functions/functions.dart';
import 'package:Grad/app/ui/android/widgets/custom/cached_network_image.dart';

class StudentResults extends GetView<ResultsController> {
  @override
  Widget build(BuildContext context) {
    final param = Get.arguments;
    return Scaffold(
      appBar: customAppBar(
        name: "${param['classname']} ${param['classarm']}",
      ),
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
    return Column(
      children: [
        Slidable(
          // Specify a key if the Slidable is dismissible.
          key: ValueKey(data['id']),
          // The start action pane is the one at the left or the top side.
          startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),
            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (_) {
                  param['handler'] = "student";
                  param['id'] = data['student']['id'];
                  param['studentId'] = data['student']['id'];
                  param['studentName'] = data['student']['first_name'] +
                      ' ' +
                      data['student']['last_name'];

                  Get.toNamed(
                    "results/past",
                    arguments: param,
                  );
                },
                foregroundColor: Color.fromARGB(255, 120, 120, 120),
                icon: FeatherIcons.server,
                label: 'Past Results',
              ),
            ],
          ),

          // The child of the Slidable is what the user sees when the
          // component is not dragged.
          child: ListTile(
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
            trailing: GestureDetector(
              onTap: () async {
                if (!controller.processing.value) {
                  await controller.getResult(data['student']['id']);
                }
                if (controller.error.value) {
                  final snackBar = SnackBar(
                    content: Text("${controller.error_msg.value}"),
                    backgroundColor: Colors.red,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                if (controller.success.value) {
                  final snackBar = SnackBar(
                    content: Text("${controller.success_msg.value}"),
                    backgroundColor: Colors.green,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  ///
                  /// Download File
                  ///
                  await controller.loadfile();
                }
              },
              child: Icon(
                FeatherIcons.download,
                color: Colors.green,
              ),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
