import 'package:Grad/app/controller/auth/verify_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

late TextEditingController c;

class VerifyAccount extends GetView<VerifyAccountController> {
  @override
  Widget build(BuildContext context) {
    c = TextEditingController();
    return Scaffold(
      appBar: _appBar(),
      body: Obx(
        () => Container(
          margin: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'Enter the 6-digit code sent to:',
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
                  "${controller.email}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  'Enter code here',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              _inputText(),
              SizedBox(
                height: 15,
              ),
              _continue(context),
              SizedBox(
                height: 5,
              ),
              _tryAgain(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputText() {
    return TextField(
      controller: c,
      keyboardType: TextInputType.number,
      maxLength: 6,
      style: TextStyle(
        fontSize: 25,
        letterSpacing: 40,
        fontWeight: FontWeight.bold,
      ),
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
      ),
    );
  }

  Widget _continue(context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        onPressed: () async {
          if (!controller.loading.value) {
            await controller.verify(
              email: controller.email,
              school: controller.school,
              code: c.text,
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
            /// redirect to verifyCode
            ///
            if (controller.redirect.value)
              await _Success(
                controller.email,
                controller.school,
              );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.blue[400],
          ),
        ),
        child: !controller.loading.value
            ? Text(
                "Continue",
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
  /// Redirect to change password
  ///
  Future<void> _Success(
    email,
    school,
  ) async {
    Future.delayed(Duration(seconds: 1), () {
      print("change password");
      Get.toNamed("/change-password", arguments: {
        "email": email,
        "school": school,
      });
    });
  }

  Widget _tryAgain(context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        onPressed: () async {
          if (!controller.searching.value) {
            await controller.retry(
              email: controller.email,
              school: controller.school,
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
            /// redirect to verifyCode
            ///
            if (controller.sent.value) {
              final snackBar = SnackBar(
                content: Text('Recovery code sent to ${controller.email}'),
                backgroundColor: Colors.green,
              );
              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.grey[300],
          ),
        ),
        child: !controller.searching.value
            ? Text(
                "Didn't get a code?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        'Recovery Password',
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
}
