import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/users_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class EditUser extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Edit User"),
      body: Text("Edit user"),
    );
  }
}
