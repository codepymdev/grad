import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/auth/change_password_controller.dart';

late TextEditingController passwordController;
late TextEditingController confirmPasswordController;

class ChangePassword extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    return Scaffold(
      appBar: _appBar(),
      body: Obx(() => Container(
            margin: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 10,
            ),
            child: _conlumn(context),
          )),
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
        _password(),
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
        _confirmpassword(),
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

  Widget _confirmpassword() {
    return TextField(
      controller: confirmPasswordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: controller.toggleOff2.value,
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
        labelText: '',
        suffix: controller.toggleOff2.value
            ? GestureDetector(
                onTap: () => controller.toggle2(),
                child: Icon(FeatherIcons.eyeOff),
              )
            : GestureDetector(
                onTap: () => controller.toggle2(),
                child: Icon(
                  FeatherIcons.eye,
                ),
              ),
      ),
    );
  }

  Widget _password() {
    return TextField(
      controller: passwordController,
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
        labelText: '',
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
