import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/subjects_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class StudentSubject extends GetView<SubjectsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "My Subjects"),
      body: Obx(() {
        if (controller.loading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var me = controller.me;
        List mysubjects = me['param']['subjects'];
        if (mysubjects.length == 0)
          return Center(
            child: Text("No Subject"),
          );
        return Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (var i = 0; i < mysubjects.length; i++)
                _buildList(
                  mysubjects[i],
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildList(subject) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "$subject",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
