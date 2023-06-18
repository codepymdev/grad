import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/classes_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class ParentClass extends StatefulWidget {
  @override
  State<ParentClass> createState() => _ParentClassState();
}

class _ParentClassState extends State<ParentClass> {
  ClassesController classesController = Get.put(ClassesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "My children classes"),
      body: Container(),
    );
  }
}
