import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/auth/forgotten_password_controller.dart';

class ForgottenPassword extends GetView<ForgottenPassowrdController> {
  @override
  Widget build(BuildContext context) {
    TextEditingController c = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            FeatherIcons.cornerUpLeft,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Find Your Account',
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
                'Enter your email address or Student ID',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: c,
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
                labelText: '',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextButton(
                        onPressed: () => Get.back(),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.grey[300],
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Obx(() => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextButton(
                            onPressed: () async {
                              if (!controller.searching.value) {
                                await controller.search(
                                  email: c.text,
                                  school: controller.school["slug"],
                                );
                                if (controller.error.value) {
                                  final snackBar = SnackBar(
                                    content:
                                        Text('${controller.error_msg.value}'),
                                    backgroundColor: Colors.red,
                                  );
                                  // Find the ScaffoldMessenger in the widget tree
                                  // and use it to show a SnackBar.
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }

                                ///
                                /// redirect to verifyCode
                                ///
                                if (controller.redirect.value)
                                  await _sentSuccess(
                                    c.text,
                                    controller.school['slug'],
                                  );
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.blue[400],
                              ),
                            ),
                            child: !controller.searching.value
                                ? Text(
                                    "Search",
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
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// Redirect after login
  ///
  Future<void> _sentSuccess(
    email,
    school,
  ) async {
    Future.delayed(Duration(seconds: 1), () {
      Get.toNamed("/verify-account", arguments: {
        "email": email,
        "school": school,
      });
    });
  }
}
