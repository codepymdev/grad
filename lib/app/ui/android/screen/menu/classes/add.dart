import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/classes_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/form/class/campus.dart';
import 'package:grad/app/ui/android/widgets/form/class/class_arm.dart';
import 'package:grad/app/ui/android/widgets/form/class/class_name.dart';
import 'package:grad/app/ui/android/widgets/form/class/description.dart';
import 'package:grad/app/ui/android/widgets/form/class/fee.dart';
import 'package:grad/app/ui/android/widgets/form/class/payment_amount.dart';
import 'package:grad/app/ui/android/widgets/form/class/payment_title.dart';
import 'package:grad/app/ui/android/widgets/form/class/section.dart';

final TextEditingController descriptionController = TextEditingController();
final TextEditingController feeController = TextEditingController();
final TextEditingController paymentTitleController = TextEditingController();
final TextEditingController paymentAmountController = TextEditingController();

class AddClass extends GetView<ClassesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Add Class"),
      body: Obx(() {
        if (controller.loading.value)
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );

        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //class name
                ClassName(),
                //class arm
                ClassArm(
                  c: controller,
                ),
                //fee
                Fee(
                  c: feeController,
                ),
                //description
                Description(
                  c: descriptionController,
                ),
                //class section
                ClassSection(
                  c: controller,
                ),
                //campus
                Campus(),
                //other payment
                PaymentTitle(
                  c: paymentTitleController,
                ),
                //payment amount
                PaymentAmount(
                  c: paymentAmountController,
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
                            "Add Class",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    onPressed: () async {
                      if (!controller.processing.value) {
                        await controller.createClass({
                          "description": descriptionController.text,
                          "fee": feeController.text,
                          "other_payment_title": paymentTitleController.text,
                          "amount": paymentAmountController.text,
                        });

                        if (controller.error.value) {
                          final snackBar = SnackBar(
                            content: Text('${controller.error_msg.value}'),
                            backgroundColor: Colors.red,
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        if (controller.success.value) {
                          final snackBar = SnackBar(
                            content: Text('${controller.success_msg.value}'),
                            backgroundColor: Colors.green,
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          ///
                          /// navigate to the users screen
                          ///
                          Get.offNamed(
                            "/classes/view",
                            arguments: controller.classId.value,
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
