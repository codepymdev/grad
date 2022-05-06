import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/users_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class ViewStudent extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Student"),
      body: Center(
        child: Text('Users'),
      ),
    );
  }
}
