import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/users_controller.dart';
import 'package:grad/app/data/model/role_model.dart' as roleModel;

class Role extends GetView<UsersController> {
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
          "Role",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<roleModel.Role>(
          isExpanded: true,
          hint: Text("Select Role"),
          value: controller.role_value.value,
          onChanged: (roleModel.Role? value) {
            if (value != null) {
              controller.updateRoleState(value);
            }
          },
          items: controller.roles
              .map(
                (e) => DropdownMenuItem<roleModel.Role>(
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
