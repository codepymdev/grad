import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassSection extends StatelessWidget {
  final c;
  ClassSection({required this.c});
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
          "Class Section",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<String>(
          isExpanded: true,
          hint: Text("Class Section"),
          value: c.section.value,
          onChanged: (String? value) {
            if (value != null) {
              c.updateClassSection(value);
            }
          },
          items: <String>[
            'Select section',
            'nursery',
            'primary',
            'junior',
            'senior'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              child: Text(value),
              value: value,
            );
          }).toList(),
        ),
      ],
    );
  }
}
