import 'package:Grad/app/controller/auth/verify_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class VerifyAccount extends StatefulWidget {
  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  late TextEditingController c = TextEditingController();
  VerifyAccountController verifyAccountController =
      Get.put(VerifyAccountController());
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
                  "${verifyAccountController.email}",
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
          if (!verifyAccountController.loading.value) {
            await verifyAccountController.verify(
              email: verifyAccountController.email,
              school: verifyAccountController.school,
              code: c.text,
            );
            if (verifyAccountController.error.value) {
              final snackBar = SnackBar(
                content: Text('${verifyAccountController.error_msg.value}'),
                backgroundColor: Colors.red,
              );
              // Find the ScaffoldMessenger in the widget tree
              // and use it to show a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }

            ///
            /// redirect to verifyCode
            ///
            if (verifyAccountController.redirect.value)
              await _Success(
                verifyAccountController.email,
                verifyAccountController.school,
              );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.blue[400],
          ),
        ),
        child: !verifyAccountController.loading.value
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
          if (!verifyAccountController.searching.value) {
            await verifyAccountController.retry(
              email: verifyAccountController.email,
              school: verifyAccountController.school,
            );
            if (verifyAccountController.error.value) {
              Fluttertoast.showToast(
                msg: '${verifyAccountController.error_msg.value}',
              );
            }

            ///
            /// redirect to verifyCode
            ///
            if (verifyAccountController.sent.value) {
              Fluttertoast.showToast(
                msg: 'Recovery code sent to ${verifyAccountController.email}',
              );
            }
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.grey[300],
          ),
        ),
        child: !verifyAccountController.searching.value
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
