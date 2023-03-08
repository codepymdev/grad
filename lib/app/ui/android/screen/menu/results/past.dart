import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/menu/results_controller.dart';
import 'package:Grad/app/core/functions/functions.dart';
import 'package:Grad/app/data/model/class_model.dart';

class PastResult extends GetView<ResultsController> {
  @override
  Widget build(BuildContext context) {
    var param = Get.arguments;
    return Scaffold(
      appBar: customAppBar(name: "${param['studentName']}"),
      body: SingleChildScrollView(
        child: Obx(
          () {
            if (controller.loading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
                bottom: 15,
              ),
              child: Column(
                children: [
                  //class
                  _class(),
                  //term
                  _term(),
                  //year
                  _year(),

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
                              "Download Result",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      onPressed: () async {
                        if (!controller.processing.value) {
                          await controller.getPastResult(param['studentId']);
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
                            /// Download File
                            ///
                            await controller.loadfile();
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

  Widget _class() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Class",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<ClasssModel>(
          isExpanded: true,
          hint: Text("Select Class"),
          value: controller.classes_value.value,
          onChanged: (ClasssModel? value) {
            if (value != null) {
              controller.updateClassState(value);
            }
          },
          items: controller.classes
              .map(
                (e) => DropdownMenuItem<ClasssModel>(
                  child: Text("${e.name} - ${e.arm}"),
                  value: e,
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _term() {
    return Container(
      margin: EdgeInsets.all(5),
      child: DropdownButton<String>(
        isExpanded: true,
        value: controller.termValue.value,
        onChanged: (String? value) {
          if (value != null) controller.updateTermDropDown(value);
        },
        items: <String>['First Term', 'Second Term', 'Third Term']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            child: Text(value),
            value: value,
          );
        }).toList(),
      ),
    );
  }

  Widget _year() {
    List<String> years = yearList();
    return Container(
      margin: EdgeInsets.all(5),
      child: DropdownButton<String>(
        isExpanded: true,
        value: controller.yearValue.value,
        onChanged: (String? value) {
          if (value != null) controller.updateYearDropDown(value);
        },
        items: years.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            child: Text(value),
            value: value,
          );
        }).toList(),
      ),
    );
  }
}
