import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassArm extends StatelessWidget {
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
        Text(
          "Class Arm",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<String>(
          isExpanded: true,
          hint: Text("Class Arm"),
          value: c.arm.value,
          onChanged: (String? value) {
            if (value != null) {
              c.updateClassArm(value);
            }
          },
          items: <String>['Select arm', 'GOLD', 'DIAMOND']
              .map<DropdownMenuItem<String>>((String value) {
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
