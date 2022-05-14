import 'package:Grad/app/controller/account/change_password_controller.dart';
import 'package:Grad/app/core/functions/functions.dart';
import 'package:Grad/app/ui/android/widgets/auth/change_password/confirm_password.dart';
import 'package:Grad/app/ui/android/widgets/auth/change_password/password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordAccount extends StatefulWidget {
  @override
  State<ChangePasswordAccount> createState() => _ChangePasswordAccountState();
}

class _ChangePasswordAccountState extends State<ChangePasswordAccount> {
  ChangePasswordAccountController changePasswordAccountController =
      Get.put(ChangePasswordAccountController());

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          c: changePasswordAccountController,
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
          c: changePasswordAccountController,
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
          if (!changePasswordAccountController.loading.value) {
            await changePasswordAccountController.change(
              confirm_password: confirmPasswordController.text,
              password: passwordController.text,
            );
            if (changePasswordAccountController.error.value) {
              final snackBar = SnackBar(
                content:
                    Text('${changePasswordAccountController.error_msg.value}'),
                backgroundColor: Colors.red,
              );
              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }

            ///
            /// redirect to dashbaord
            ///
            if (changePasswordAccountController.redirect.value)
              await _success();
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.blue[400],
          ),
        ),
        child: !changePasswordAccountController.loading.value
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
