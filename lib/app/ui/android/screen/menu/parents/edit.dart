import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/menu/users_controller.dart';
import 'package:Grad/app/core/functions/functions.dart';

class EditParent extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Parents"),
      body: Center(
        child: Text('Users'),
      ),
    );
  }
}
