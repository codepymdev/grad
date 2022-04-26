import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/classes_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class EditClass extends GetView<ClassesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Edit Class"),
      body: Obx(() {
        if (controller.loading.value)
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );

        return Center(
          child: Text("Edit Class"),
        );
      }),
    );
  }
}
