import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/menu/users_controller.dart';
import 'package:Grad/app/core/functions/functions.dart';

class EditUser extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Edit User"),
      body: Text("Edit user"),
    );
  }
}
