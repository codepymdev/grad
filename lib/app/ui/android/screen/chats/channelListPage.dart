import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/home/home_controller.dart';
import 'package:grad/app/ui/android/screen/chats/channelPage.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelListPage extends StatefulWidget {
  @override
  State<ChannelListPage> createState() => _ChannelListPageState();
}

class _ChannelListPageState extends State<ChannelListPage> {
  late final StreamChannelListController _listController;

  @override
  void initState() {
    _listController = StreamChannelListController(
      client: StreamChat.of(context).client,
      filter: Filter.in_(
        'members',
        [StreamChat.of(context).currentUser!.id],
      ),
      sort: const [SortOption('last_message_at')],
      limit: 20,
    );
    super.initState();
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var homeController = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColorDark,
        leading: Container(
          padding: EdgeInsets.all(10),
          child: Badge(
            badgeColor: Colors.green,
            toAnimate: false,
            position: BadgePosition(
              bottom: 0,
              start: 5,
            ),
            child: ClipOval(
              child: Obx(
                () => CustomNetworkImage(
                  url: "${homeController.user['avatar']}",
                  wd: 80,
                  ht: 80,
                ),
              ),
            ),
          ),
        ),
      ),
      body: StreamChannelListView(
        controller: _listController,
        onChannelTap: (channel) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return StreamChannel(
                  child: ChannelPage(),
                  channel: channel,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
