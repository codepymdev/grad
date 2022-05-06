import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/account/change_password_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/auth/change_password/confirm_password.dart';
import 'package:grad/app/ui/android/widgets/auth/change_password/password.dart';

late TextEditingController passwordController;
late TextEditingController confirmPasswordController;

class ChangePasswordAccount extends GetView<ChangePasswordAccountController> {
  @override
  Widget build(BuildContext context) {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    return Scaffold(
      appBar: customAppBar(name: "Change Password"),
      body: Obx(
        () => Container(
          margin: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
          ),
          child: _conlumn(context),
        ),
      ),
    );
  }

  Widget _conlumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Reset Password',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          child: Text(
            'New Password',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Password(
          c: controller,
          c2: passwordController,
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          child: Text(
            'Confirm Password',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ConfirmPassword(
          c: controller,
          c2: confirmPasswordController,
        ),
        SizedBox(
          height: 15,
        ),
        _continue(context),
      ],
    );
  }

  Widget _continue(context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: () async {
          if (!controller.loading.value) {
            await controller.change(
              confirm_password: confirmPasswordController.text,
              password: passwordController.text,
            );
            if (controller.error.value) {
              final snackBar = SnackBar(
                content: Text('${controller.error_msg.value}'),
                backgroundColor: Colors.red,
              );
              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }

            ///
            /// redirect to dashbaord
            ///
            if (controller.redirect.value) await _success();
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.blue[400],
          ),
        ),
        child: !controller.loading.value
            ? Text(
                "Chanage Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  ///
  /// Redirect after login
  ///
  Future<void> _success() async {
    Future.delayed(Duration(seconds: 1), () {
      Get.offAllNamed("/success-page", arguments: {
        "type": "change_password",
        "message": "Password changed successful"
      });
    });
  }
}
