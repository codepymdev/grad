import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/users_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';

class MyParents extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "My Parents"),
      body: Obx(
        () {
          if (controller.loading.value)
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          var me = controller.me;
          var myparents = me['param']['parent'];
          if (myparents['status'] == false)
            return Center(
              child: Text("No Parent"),
            );
          var parent = me['param']['parent']['data'];
          return Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildList(
                  parent,
                  context,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildList(data, context) {
    return Column(
      children: [
        ListTile(
          leading: ClipOval(
            child: CustomNetworkImage(
              url: "${data['avatar']}",
            ),
          ),
          title: Text(
            "${data['first_name']} ${data['last_name']}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "${data['email']}",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          trailing: GestureDetector(
            onTap: () async {
              await createChannel(context,
                  "${chatStreamId(controller.school.value, data['id'])}");
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
