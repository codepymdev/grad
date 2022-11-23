import 'package:Grad/app/controller/menu/users_controller.dart';
import 'package:Grad/app/ui/android/widgets/custom/iosLoader.dart';
import 'package:Grad/app/ui/android/widgets/staffs/t-list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Teachers extends StatefulWidget {
  @override
  State<Teachers> createState() => _TeachersState();
}

class _TeachersState extends State<Teachers> {
  UsersController usersController = Get.put(UsersController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (usersController.loading.value)
        return Container(
          child: Center(
            child: IosLoader(),
          ),
        );
      var data = usersController.teachers;
      return Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            for (var i = 0; i < data.length; i++)
              TList(
                data: data[i],
                type: "teacher",
              ),
          ],
        ),
      );
    });
  }
}
