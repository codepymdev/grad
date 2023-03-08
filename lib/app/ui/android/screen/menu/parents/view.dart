import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/menu/users_controller.dart';
import 'package:Grad/app/core/functions/functions.dart';

class ViewParent extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    var param = Get.arguments;
    return Scaffold(
      appBar: customAppBar(
        name: "${param['first_name']} ${param['last_name']}",
      ),
      body: Center(
        child: Text('Users'),
      ),
    );
  }
}
