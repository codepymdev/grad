import 'package:flutter/material.dart';

class StaffType extends StatelessWidget {
  final c;
  StaffType({required this.c});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Staff Type",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          DropdownButton<String>(
            isExpanded: true,
            value: c.gender.value,
            onChanged: (String? value) {
              if (value != null) {
                c.updateStaffTypeState(value);
              }
            },
            items: <String>['Select staff type', 'Teaching', 'Non-teaching']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                child: Text(value),
                value: value,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
