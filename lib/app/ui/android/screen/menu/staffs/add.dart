import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/menu/users_controller.dart';
import 'package:Grad/app/core/functions/functions.dart';
import 'package:Grad/app/ui/android/widgets/form/user/address.dart';
import 'package:Grad/app/ui/android/widgets/form/user/campus.dart';
import 'package:Grad/app/ui/android/widgets/form/user/city.dart';
import 'package:Grad/app/ui/android/widgets/form/user/country.dart';
import 'package:Grad/app/ui/android/widgets/form/user/emailaddress.dart';
import 'package:Grad/app/ui/android/widgets/form/user/firstname.dart';
import 'package:Grad/app/ui/android/widgets/form/user/gender.dart';
import 'package:Grad/app/ui/android/widgets/form/user/lastname.dart';
import 'package:Grad/app/ui/android/widgets/form/user/middlename.dart';
import 'package:Grad/app/ui/android/widgets/form/user/phone.dart';
import 'package:Grad/app/ui/android/widgets/form/user/role.dart';
import 'package:Grad/app/ui/android/widgets/form/user/stafftype.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController firstNameController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();
final TextEditingController middleNameController = TextEditingController();
final TextEditingController phoneNumberController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController cityController = TextEditingController();
final TextEditingController countryController = TextEditingController();

class AddStaff extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Add Staff"),
      body: SingleChildScrollView(
        child: Obx(
          () {
            if (controller.loading.value) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Container(
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///
                  ///Email address
                  ///
                  EmailAddress(
                    c: emailController,
                  ),

                  ///
                  /// Staff type
                  ///
                  StaffType(
                    c: controller,
                  ),

                  ///
                  /// first name
                  ///
                  FirstName(
                    c: firstNameController,
                  ),

                  ///
                  /// last name
                  ///
                  LastName(
                    c: lastNameController,
                  ),

                  ///
                  /// middle name
                  ///
                  MiddleName(
                    c: middleNameController,
                  ),

                  ///
                  /// phone number
                  ///
                  Phone(
                    c: phoneNumberController,
                  ),

                  ///
                  /// gender
                  ///
                  Gender(
                    c: controller,
                  ),

                  ///
                  /// Campus
                  ///
                  Campus(),

                  ///
                  /// role
                  ///
                  controller.display_role.value ? Role() : Container(),

                  ///
                  /// Address
                  ///
                  Address(
                    c: addressController,
                  ),

                  ///
                  /// city
                  ///
                  City(
                    c: cityController,
                  ),

                  ///
                  /// country
                  ///
                  Country(
                    c: countryController,
                  ),

                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(),
                      child: controller.processing.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              "Add User",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      onPressed: () async {
                        if (!controller.processing.value) {
                          await controller.createUser({
                            "email": emailController.text,
                            "first_name": firstNameController.text,
                            "last_name": lastNameController.text,
                            "middle_name": middleNameController.text,
                            "tel": phoneNumberController.text,
                            "address": addressController.text,
                            "city": cityController.text,
                            "country": countryController.text,
                            "type": "staff",
                          });

                          if (controller.error.value) {
                            final snackBar = SnackBar(
                              content: Text('${controller.error_msg.value}'),
                              backgroundColor: Colors.red,
                            );
                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          if (controller.success.value) {
                            final snackBar = SnackBar(
                              content: Text('${controller.success_msg.value}'),
                              backgroundColor: Colors.green,
                            );
                            // Find the ScaffoldMessenger in the widget tree
                            // and use it to show a SnackBar.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            ///
                            /// navigate to the users screen
                            ///
                            Get.toNamed(
                              "/staffs/view",
                              arguments: controller.userId.value,
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
