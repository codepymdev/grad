import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/classes_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class TeacherClass extends StatefulWidget {
  @override
  State<TeacherClass> createState() => _TeacherClassState();
}

class _TeacherClassState extends State<TeacherClass> {
  ClassesController classesController = Get.put(ClassesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "My Class"),
      body: Container(),
    );
  }
}
