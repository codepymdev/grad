import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/users_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class ViewUser extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    var userId = Get.arguments;
    print(userId);
    return Scaffold(
      appBar: customAppBar("View User"),
      body: Text("add user"),
    );
  }
}
