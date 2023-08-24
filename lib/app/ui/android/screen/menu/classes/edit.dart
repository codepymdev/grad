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

class EditClass extends StatefulWidget {
  @override
  State<EditClass> createState() => _EditClassState();
}

class _EditClassState extends State<EditClass> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  TextEditingController paymentTitleController = TextEditingController();
  TextEditingController paymentAmountController = TextEditingController();
  ClassesController classesController = Get.put(ClassesController());
  @override
  Widget build(BuildContext context) {
    dynamic data = Get.arguments;
    return Scaffold(
      appBar: customAppBar(name: "Edit Class"),
      body: Obx(() {
        if (classesController.loading.value)
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );

        ///
        /// pass value to controller
        ///
        classesController.arm.value = data['arm'];
        classesController.section.value = data['section'];
        // Rxn<ClassCategoriesModel> _model = Rxn<ClassCategoriesModel>();
        // controller.classCategory.value = _model.update((val) {
        //   val.!id = "";
        //   val.name = "";
        // });

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
                  c: classesController,
                ),
                //fee
                Fee(
                  c: feeController,
                  edit: true,
                  val: data['fee'],
                ),
                //description
                Description(
                  c: descriptionController,
                  edit: true,
                  val: data['description'],
                ),
                //class section
                ClassSection(
                  c: classesController,
                ),
                //campus
                Campus(),
                //other payment
                PaymentTitle(
                  c: paymentTitleController,
                  edit: true,
                  val: data['other_payment_title'],
                ),
                //payment amount
                PaymentAmount(
                  c: paymentAmountController,
                  edit: true,
                  val: data['amount'],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
