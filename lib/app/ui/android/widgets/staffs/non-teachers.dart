import 'package:Grad/app/controller/menu/users_controller.dart';
import 'package:Grad/app/ui/android/widgets/staffs/t-list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NonTeachers extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value)
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      var data = controller.staffs;
      return Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            for (var i = 0; i < data.length; i++)
              TList(
                data: data[i],
                type: "non-teacher",
              ),
          ],
        ),
      );
    });
  }
}
