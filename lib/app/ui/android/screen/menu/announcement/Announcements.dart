import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/announcement_controller.dart';
import 'package:grad/app/core/constants/asset_path.dart';
import 'package:grad/app/core/functions/functions.dart';

class Announcements extends GetView<AnnouncementController> {
  const Announcements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Announcements"),
      body: Obx(() {
        if (controller.loading.value)
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        var data = controller.announcements;

        if (data.length == 0)
          return Center(
            child: Text("No Announcement"),
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
                onPressed: (_) async => await controller.delete(data['id']),
                backgroundColor: Color.fromARGB(255, 195, 39, 39),
                foregroundColor: Colors.white,
                icon: FeatherIcons.trash,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: (_) => Get.toNamed(
                  "/announcement/edit",
                  arguments: data,
                ),
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: FeatherIcons.edit,
                label: 'Edit',
              ),
            ],
          ),

          // The end action pane is the one at the right or the bottom side.
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              data['pinned'] == "0"
                  ? SlidableAction(
                      onPressed: (_) async => await controller.pin(data['id']),
                      backgroundColor: Color(0xFF7BC043),
                      foregroundColor: Colors.white,
                      icon: FeatherIcons.alertOctagon,
                      label: 'Pin',
                    )
                  : SlidableAction(
                      onPressed: (_) async =>
                          await controller.unpin(data['id']),
                      backgroundColor: Color.fromARGB(255, 150, 5, 29),
                      foregroundColor: Colors.white,
                      icon: FeatherIcons.alertOctagon,
                      label: 'Unpin',
                    )
            ],
          ),
          // The child of the Slidable is what the user sees when the
          // component is not dragged.
          child: ListTile(
            leading: announcementIcons(data['type']),
            title: Text(
              "${data['type']}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "${data['message']}",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            trailing: data['pinned'] == "0"
                ? Icon(
                    FeatherIcons.archive,
                  )
                : Icon(
                    FeatherIcons.bell,
                    color: Colors.green,
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
      onPressed: () => Get.toNamed("/announcement/add"),
      child: SvgPicture.asset(
        ANNOUNCEMENT,
        width: 40,
      ),
    );
  }
}
