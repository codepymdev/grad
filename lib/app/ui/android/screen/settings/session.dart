import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/settings/settings_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class Session extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Session"),
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
              children: [
                _term(),
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
                            "Save",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    onPressed: () async {
                      if (!controller.processing.value) {
                        await controller.updateSession();
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
