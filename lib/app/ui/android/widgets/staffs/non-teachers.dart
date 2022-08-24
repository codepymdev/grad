import 'package:grad/app/controller/menu/users_controller.dart';
import 'package:grad/app/ui/android/widgets/custom/iosLoader.dart';
import 'package:grad/app/ui/android/widgets/staffs/t-list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NonTeachers extends StatefulWidget {
  @override
  State<NonTeachers> createState() => _NonTeachersState();
}

class _NonTeachersState extends State<NonTeachers> {
  UsersController usersController = Get.put(UsersController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (usersController.loading.value)
        return Container(
          child: IosLoader(),
        );
      var data = usersController.staffs;
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
