import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/menu/users_controller.dart';
import 'package:Grad/app/data/model/campus_model.dart' as campusModel;

class Campus extends GetView<UsersController> {
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
        Text(
          "Campus",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<campusModel.Campus>(
          isExpanded: true,
          hint: Text("Select Campus"),
          value: controller.campus_value.value,
          onChanged: (campusModel.Campus? value) {
            if (value != null) {
              controller.updateCampusState(value);
            }
          },
          items: controller.campus
              .map(
                (e) => DropdownMenuItem<campusModel.Campus>(
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
