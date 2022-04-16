import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/announcement_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

late TextEditingController messagecontroller;
late var data;

class EditAnnouncement extends GetView<AnnouncementController> {
  @override
  Widget build(BuildContext context) {
    data = Get.arguments;
    return Scaffold(
      appBar: customAppBar("Edit Announcement"),
      body: Obx(() {
        if (controller.loading.value)
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        return Container(
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
            bottom: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 2,
                  left: 2,
                ),
                child: Text(
                  "Announcement Type",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _type(),
              Container(
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 2,
                  left: 2,
                ),
                child: Text(
                  "Message",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _message(),
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
                          "Update",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  onPressed: () async {
                    if (!controller.processing.value) {
                      await controller.edit(
                        id: data['id'],
                        message: messagecontroller.text,
                      );

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

                        Get.offAllNamed('/announcement');
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _type() {
    return Container(
      margin: EdgeInsets.all(5),
      child: DropdownButton<String>(
        isExpanded: true,
        value: controller.type.value,
        onChanged: (String? value) {
          if (value != null) controller.updateType(value);
        },
        items: <String>[
          'General Announcement',
          'Public Holiday',
          'Mid term break',
          'Examination',
          'School Fees',
          'PTA Meeting',
          'Result',
          'Others'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            child: Text(value),
            value: value,
          );
        }).toList(),
      ),
    );
  }

  Widget _message() {
    messagecontroller = TextEditingController(
      text: data['message'],
    );
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: messagecontroller,
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
        ),
      ),
    );
  }
}
