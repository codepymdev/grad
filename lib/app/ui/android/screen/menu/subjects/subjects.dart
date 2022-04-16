import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/subjects_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class Subjects extends GetView<SubjectsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Subjects"),
      body: Center(
        child: Text('Users'),
      ),
    );
  }
}
