import 'package:grad/app/controller/auth/login_controller.dart';
import 'package:grad/app/ui/android/widgets/auth/login/email.dart';
import 'package:grad/app/ui/android/widgets/auth/login/login_button.dart';
import 'package:grad/app/ui/android/widgets/auth/login/password.dart';
import 'package:grad/app/ui/android/widgets/auth/login/top_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController loginController = Get.put(LoginController());
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          String logo = loginController.school['logo'];
          String name = loginController.school['name'];
          String slug = loginController.school['slug'];
          return Container(
            margin: EdgeInsets.only(
              top: 30,
              left: 10,
              right: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                TopContent(logo: logo, name: name),
                Container(
                  margin: EdgeInsets.only(
                    left: 5,
                    right: 5,
                    top: 50,
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
                        height: 10,
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
                  height: 10,
                ),

                ///
                /// Forgot password
                ///
                GestureDetector(
                  onTap: () => Get.toNamed("/forgotten-password", arguments: {
                    "school": loginController.school,
                  }),
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                      right: 10,
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
                    "school": loginController.school,
                  }),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
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
