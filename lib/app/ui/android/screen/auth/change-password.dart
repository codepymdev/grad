import 'package:Grad/app/controller/auth/change_password_controller.dart';
import 'package:Grad/app/ui/android/widgets/auth/change_password/confirm_password.dart';
import 'package:Grad/app/ui/android/widgets/auth/change_password/password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

late TextEditingController passwordController;
late TextEditingController confirmPasswordController;

class ChangePassword extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    return Scaffold(
      appBar: _appBar(),
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
            if (controller.redirect.value) await _loginSuccess();
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

  AppBar _appBar() {
    return AppBar(
      title: Text(
        'Change Password',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
    );
  }

  ///
  /// Redirect after login
  ///
  Future<void> _loginSuccess() async {
    Future.delayed(Duration(seconds: 1), () {
      Get.offAllNamed("/");
    });
  }
}
