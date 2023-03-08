import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/menu/users_controller.dart';
import 'package:Grad/app/core/functions/functions.dart';
import 'package:Grad/app/ui/android/widgets/custom/cached_network_image.dart';

class ClassMates extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "My Classmates"),
      body: Obx(() {
        if (controller.loading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var me = controller.me;
        List classmates = me['param']['classmate'];
        if (classmates.length == 0)
          return Center(
            child: Text("No Classmate"),
          );
        return Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (var i = 0; i < classmates.length; i++)
                _buildList(
                  classmates[i],
                  context,
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildList(classmate, context) {
    return Column(
      children: [
        ListTile(
          leading: ClipOval(
            child: CustomNetworkImage(
              url: "${classmate['avatar']}",
            ),
          ),
          title: Text(
            "${classmate['first_name']} ${classmate['last_name']}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "${classmate['reg_no']}",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          trailing: GestureDetector(
            onTap: () async {
              await createChannel(context,
                  "${chatStreamId(controller.school.value, classmate['id'])}");
            },
            child: Container(
              child: Icon(
                FeatherIcons.messageCircle,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
