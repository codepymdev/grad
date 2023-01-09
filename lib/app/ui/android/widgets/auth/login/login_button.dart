import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/auth/login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad/app/ui/android/widgets/custom/ios_loader.dart';

class LoginButton extends GetView<LoginController> {
  const LoginButton({
    Key? key,
    required this.emailcontroller,
    required this.passwordcontroller,
    required this.slug,
  }) : super(key: key);

  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;
  final String slug;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
        ),
        width: double.infinity,
        height: 50.0.h,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          child: !controller.loginLoader.value
              ? Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              : IosLoader(
                  color: Colors.white,
                ),
          onPressed: () async {
            if (!controller.loginLoader.value) {
              await controller.login(
                email: emailcontroller.text,
                password: passwordcontroller.text,
                school: slug,
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
        ),
      ),
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
