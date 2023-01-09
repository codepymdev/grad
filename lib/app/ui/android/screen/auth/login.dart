import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/auth/login_controller.dart';
import 'package:grad/app/ui/android/widgets/auth/login/email.dart';
import 'package:grad/app/ui/android/widgets/auth/login/login_button.dart';
import 'package:grad/app/ui/android/widgets/auth/login/password.dart';
import 'package:grad/app/ui/android/widgets/auth/login/top_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

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
      body: SingleChildScrollView(
        child: Obx(() {
          String? logo = controller.school['logo'];
          String name = controller.school['name'];
          String slug = controller.school['database_name'];
          return Container(
            margin: EdgeInsets.only(
              top: 30.h,
              left: 10.w,
              right: 10.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                TopContent(logo: logo, name: name),
                Container(
                  margin: EdgeInsets.only(
                    left: 5.w,
                    right: 5.w,
                    top: 50.h,
                  ),
                  child: Column(
                    children: [
                      ///
                      /// Email / Student ID field
                      ///
                      EmailStudentIDField(
                        c: emailcontroller,
                      ),

                      ///
                      ///
                      ///
                      SizedBox(
                        height: 10.h,
                      ),

                      ///
                      /// Password field
                      ///
                      PasswordField(
                        c: passwordcontroller,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),

                ///
                /// Forgot password
                ///
                GestureDetector(
                  onTap: () => Get.toNamed("/forgotten-password", arguments: {
                    "school": controller.school,
                  }),
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 10.h,
                      top: 10.w,
                      right: 10.w,
                    ),
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgotten your password?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 65, 63, 63),
                      ),
                    ),
                  ),
                ),

                ///
                /// login button
                ///
                LoginButton(
                  emailcontroller: emailcontroller,
                  passwordcontroller: passwordcontroller,
                  slug: slug,
                ),

                ///
                /// create account
                ///
                GestureDetector(
                  onTap: () => Get.toNamed("/create-account", arguments: {
                    "school": controller.school,
                  }),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 20.h,
                      bottom: 10.h,
                    ),
                    child: Text(
                      "Don't have an account yet?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 65, 63, 63),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
