import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/settings/settings_controller.dart';
import 'package:Grad/app/core/functions/functions.dart';

class Term extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Term"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
            bottom: 15,
          ),
          child: Obx(() {
            if (controller.loading.value)
              return Center(
                child: CircularProgressIndicator(),
              );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    left: 2,
                  ),
                  child: Text(
                    "Next term begins",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                _nextTerm(context),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 5,
                    left: 2,
                  ),
                  child: Text(
                    "Term Ends",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                _termEnd(context),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 5,
                    left: 2,
                  ),
                  child: Text(
                    "Term Begins",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                _termBegins(context),
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
                            "Save",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    onPressed: () async {
                      if (!controller.processing.value) {
                        await controller.updateTerm();
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
                        }
                      }
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _nextTerm(context) {
    return GestureDetector(
      onTap: () => _selectDate(context, "next_term"),
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 6,
          right: 6,
        ),
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey[350]!,
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${controller.next_term_begins.value}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Icon(
              FeatherIcons.calendar,
            ),
          ],
        ),
      ),
    );
  }

  Widget _termEnd(context) {
    return GestureDetector(
      onTap: () => _selectDate(context, "term_end"),
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 6,
          right: 6,
        ),
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey[350]!,
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${controller.term_ends.value}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Icon(
              FeatherIcons.calendar,
            ),
          ],
        ),
      ),
    );
  }

  Widget _termBegins(context) {
    return GestureDetector(
      onTap: () => _selectDate(context, "term_begins"),
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 6,
          right: 6,
        ),
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey[350]!,
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${controller.term_begins.value}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Icon(
              FeatherIcons.calendar,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, String type) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: controller.initial_date.value!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (type == "next_term") {
      if (picked != null && picked != controller.next_term_begins.value) {
        controller.selectDate(picked, type);
      }
    } else if (type == "term_end") {
      if (picked != null && picked != controller.term_begins.value) {
        controller.selectDate(picked, type);
      }
    } else if (type == "term_begins") {
      if (picked != null && picked != controller.term_begins.value) {
        controller.selectDate(picked, type);
      }
    }
  }
}
