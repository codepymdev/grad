import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/auth/login_controller.dart';

class EmailStudentIDField extends StatefulWidget {
  const EmailStudentIDField({
    Key? key,
    required this.c,
  }) : super(key: key);
  final c;

  @override
  State<EmailStudentIDField> createState() => _EmailStudentIDFieldState();
}

class _EmailStudentIDFieldState extends State<EmailStudentIDField> {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Obx(
        () => TextField(
          controller: widget.c,
          keyboardType: TextInputType.name,
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
            labelText: 'Email / Student ID',
            errorText: loginController.emailerror.value
                ? loginController.email_msg.value
                : null,
          ),
        ),
      ),
    );
  }
}
