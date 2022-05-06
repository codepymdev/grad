import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/classes_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class ClassResult extends GetView<ClassesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Select Class"),
      body: Obx(() {
        if (controller.loading.value)
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        var data = controller.classes;

        if (data.length == 0)
          return Center(
            child: Text("No Class"),
          );
        return Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (var i = 0; i < data.length; i++)
                _buildList(
                  data[i],
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildList(data) {
    return Column(
      children: [
        ListTile(
          onTap: () => Get.toNamed(
            "/results/students",
            arguments: {
              "handler": "students",
              "classname": data['name'],
              "classarm": data['arm'],
              "id": data['id'],
              "classId": data['id'],
            },
          ),
          leading: classSection("${data['section']}"),
          title: Text(
            "${data['name']} ${data['arm']}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
