import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/auth/login_controller.dart';

class PasswordField extends GetView<LoginController> {
  const PasswordField({
    Key? key,
    required this.c,
  }) : super(key: key);

  final c;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          margin: EdgeInsets.all(5),
          child: TextField(
            controller: c,
            keyboardType: TextInputType.visiblePassword,
            obscureText: controller.toggleOff.value,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[350]!,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[350]!,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue[200]!,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              labelText: 'Password',
              errorText: controller.passworderror.value
                  ? controller.password_msg.value
                  : null,
              suffix: controller.toggleOff.value
                  ? GestureDetector(
                      onTap: () => controller.toggle(),
                      child: Icon(FeatherIcons.eyeOff),
                    )
                  : GestureDetector(
                      onTap: () => controller.toggle(),
                      child: Icon(
                        FeatherIcons.eye,
                      ),
                    ),
            ),
          ),
        ));
  }
}
