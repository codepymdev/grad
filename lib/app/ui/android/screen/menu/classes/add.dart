import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/classes_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/ios_loader.dart';
import 'package:grad/app/ui/android/widgets/form/class/campus.dart';
import 'package:grad/app/ui/android/widgets/form/class/class_arm.dart';
import 'package:grad/app/ui/android/widgets/form/class/class_name.dart';
import 'package:grad/app/ui/android/widgets/form/class/description.dart';
import 'package:grad/app/ui/android/widgets/form/class/fee.dart';
import 'package:grad/app/ui/android/widgets/form/class/section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddClass extends GetView<ClassesController> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController feeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Add Class"),
      body: Obx(() {
        if (controller.loading.value) return IosLoader();
        var subjects = controller.subjects;
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

                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                    ),
                                    child: TextButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.red,
                                        ),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        "Close",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                    ),
                                    child: TextButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.green,
                                        ),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text("${subjects[index]['name']}"),
                                  trailing: Checkbox(
                                    value: subjects[index]['checked'],
                                    onChanged: (bool? value) {
                                      controller.updateSubjectCheckedList(
                                        value,
                                        subjects[index]['id'],
                                      );
                                    },
                                  ), //Checkbox,
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemCount: subjects.length,
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    child: Text(
                      "Update Subjects",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: controller.processing.value
                        ? IosLoader()
                        : Text(
                            "Add Class",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                    onPressed: () async {
                      if (!controller.processing.value) {
                        await controller.createClass({
                          "description": descriptionController.text,
                          "fee": feeController.text,
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
                          Get.toNamed(
                            "/classes",
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
