import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/classes_controller.dart';
import 'package:grad/app/data/model/arm_model.dart' as armModel;

class ClassArm extends GetView<ClassesController> {
  final c;
  ClassArm({required this.c});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Obx(
        () => _method(),
      ),
    );
  }

  Widget _method() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<armModel.Arm>(
          isExpanded: true,
          hint: Text("Arms"),
          value: controller.arm_value.value,
          onChanged: (armModel.Arm? value) {
            if (value != null) {
              controller.updateClassArm(value);
            }
          },
          items: controller.arm
              .map(
                (e) => DropdownMenuItem<armModel.Arm>(
                  child: Text("${e.name}"),
                  value: e,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
