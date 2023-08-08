import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/auth/login_controller.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.c,
  }) : super(key: key);

  final c;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          margin: EdgeInsets.all(5),
          child: TextField(
            controller: widget.c,
            keyboardType: TextInputType.visiblePassword,
            obscureText: loginController.toggleOff.value,
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
              errorText: loginController.passworderror.value
                  ? loginController.password_msg.value
                  : null,
              suffix: loginController.toggleOff.value
                  ? GestureDetector(
                      onTap: () => loginController.toggle(),
                      child: Icon(FeatherIcons.eyeOff),
                    )
                  : GestureDetector(
                      onTap: () => loginController.toggle(),
                      child: Icon(
                        FeatherIcons.eye,
                      ),
                    ),
            ),
          ),
        ));
  }
}
