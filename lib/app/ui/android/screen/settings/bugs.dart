import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/settings/settings_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

late TextEditingController namecontroller;
late TextEditingController notecontroller;

class Bugs extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Report Bugs"),
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
                _bugname(),
                _bugnote(),
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
                            "Report Bug",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    onPressed: () async {
                      if (!controller.processing.value) {
                        await controller.submitBugIssue(data: {
                          "name": namecontroller.text,
                          "note": notecontroller.text,
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

  Widget _bugnote() {
    notecontroller = TextEditingController();
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: notecontroller,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[350]!,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[350]!,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[200]!,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          labelText: 'Bug Note',
        ),
      ),
    );
  }

  Widget _bugname() {
    namecontroller = TextEditingController();
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: namecontroller,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[350]!,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[350]!,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[200]!,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          labelText: 'Bug name',
        ),
      ),
    );
  }
}
