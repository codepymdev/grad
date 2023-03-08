import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/menu/subjects_controller.dart';
import 'package:Grad/app/core/functions/functions.dart';

class Subjects extends GetView<SubjectsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Subjects"),
      body: Obx(() {
        if (controller.loading.value)
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        var data = controller.subjects;

        if (data.length == 0)
          return Center(
            child: Text("No Subject"),
          );
        return Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (var i = 0; i < data.length; i++)
                _buildSlideAble(
                  data[i],
                  context,
                ),
            ],
          ),
        );
      }),
      // floatingActionButton: _buildFloatActionButton(),
    );
  }

  Widget _buildSlideAble(
    data,
    context,
  ) {
    return Column(
      children: [
        Slidable(
          // Specify a key if the Slidable is dismissible.
          key: ValueKey(data['id']),
          // The start action pane is the one at the left or the top side.
          startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),

            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (_) async => showDeleteDialog(context, data['id']),
                foregroundColor: Color.fromARGB(255, 120, 120, 120),
                icon: FeatherIcons.trash,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (_) => Get.toNamed(
                  "/subjects/edit",
                  arguments: data,
                ),
                foregroundColor: Color.fromARGB(255, 125, 124, 124),
                icon: FeatherIcons.edit,
                label: 'Edit',
              ),
            ],
          ),

          // The child of the Slidable is what the user sees when the
          // component is not dragged.
          child: ListTile(
            onTap: () => Get.toNamed(
              "/subjects/view",
              arguments: data,
            ),
            title: Text(
              "${data['name']}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _buildFloatActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () => Get.toNamed("/subjects/add"),
      child: Icon(
        FeatherIcons.plus,
        color: Color(0xFF21B7CA),
      ),
    );
  }

  ///
  /// Delete pop up
  ///

  showDeleteDialog(BuildContext context, id) {
    ///
    ///No button
    ///
    Widget nobutton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    ///
    /// yes button
    ///
    Widget yesButton = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        Navigator.pop(context);
        await controller.deleteSubject(id);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Subject"),
      content: Text("Are you sure you want to delete this subject?"),
      actions: [
        nobutton,
        yesButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
