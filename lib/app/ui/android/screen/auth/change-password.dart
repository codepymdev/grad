import 'package:grad/app/controller/auth/change_password_controller.dart';
import 'package:grad/app/ui/android/widgets/auth/change_password/confirm_password.dart';
import 'package:grad/app/ui/android/widgets/auth/change_password/password.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  ChangePasswordController changePasswordController =
      Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
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
          c: changePasswordController,
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
          c: changePasswordController,
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
          if (!changePasswordController.loading.value) {
            await changePasswordController.change(
              confirm_password: confirmPasswordController.text,
              password: passwordController.text,
            );
            if (changePasswordController.error.value) {
              Fluttertoast.showToast(
                msg: changePasswordController.error_msg.value,
              );
            }

            ///
            /// redirect to dashbaord
            ///
            if (changePasswordController.redirect.value) await _loginSuccess();
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.blue[400],
          ),
        ),
        child: !changePasswordController.loading.value
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
