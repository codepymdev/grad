import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/subjects_controller.dart';
import 'package:grad/app/data/model/subject_categories.dart';

class SubjectName extends GetView<SubjectsController> {
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
          "Subject Name",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<SubjectCategoriesModel>(
          isExpanded: true,
          value: controller.subjectCategory.value,
          onChanged: (SubjectCategoriesModel? value) {
            if (value != null) {
              controller.updateSubjectName(value);
            }
          },
          items: controller.subjectCategories
              .map(
                (e) => DropdownMenuItem<SubjectCategoriesModel>(
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
