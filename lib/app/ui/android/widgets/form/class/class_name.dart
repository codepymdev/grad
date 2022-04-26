import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/classes_controller.dart';
import 'package:grad/app/data/model/class_categories_model.dart';

class ClassName extends GetView<ClassesController> {
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
          "Class Name",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<ClassCategoriesModel>(
          isExpanded: true,
          value: controller.classCategory.value,
          onChanged: (ClassCategoriesModel? value) {
            if (value != null) {
              controller.updateClassName(value);
            }
          },
          items: controller.classCategories
              .map(
                (e) => DropdownMenuItem<ClassCategoriesModel>(
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
