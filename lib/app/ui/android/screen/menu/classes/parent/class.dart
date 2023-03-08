import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/menu/classes_controller.dart';
import 'package:Grad/app/core/functions/functions.dart';

class ParentClass extends GetView<ClassesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "My children classes"),
      body: Container(),
    );
  }
}
