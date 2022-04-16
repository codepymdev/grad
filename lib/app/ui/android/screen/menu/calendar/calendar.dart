import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/calendar/calendar_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class Calendar extends GetView<CalendarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Calendar"),
      body: Obx(() {
        if (controller.loading.value)
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        var data = controller.other_events;
        if (data.length == 0)
          return Center(
            child: Text("No Events"),
          );
        return Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (var i = 0; i < data.length; i++) _buildSlideAble(data[i]),
            ],
          ),
        );
      }),
      floatingActionButton: _buildFloatActionButton(),
    );
  }

  Widget _buildSlideAble(data) {
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
                onPressed: (_) async =>
                    await controller.deleteEvent(data['id']),
                backgroundColor: Color.fromARGB(255, 195, 39, 39),
                foregroundColor: Colors.white,
                icon: FeatherIcons.trash,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (_) => Get.toNamed(
                  "/calendar/edit",
                  arguments: data,
                ),
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: FeatherIcons.edit,
                label: 'Edit',
              ),
            ],
          ),

          child: ListTile(
            title: Text(
              "${data['title']}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "${data['description']}",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
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
      onPressed: () => Get.toNamed("/new-event"),
      child: Icon(
        FeatherIcons.plus,
        color: Color.fromARGB(255, 195, 39, 39),
      ),
    );
  }
}
