import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:grad/app/ui/android/screen/chats/channelPage.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChannelListPage extends StatefulWidget {
  @override
  State<ChannelListPage> createState() => _ChannelListPageState();
}

class _ChannelListPageState extends State<ChannelListPage> {
  late final _listController = StreamChannelListController(
    client: StreamChat.of(context).client,
    filter: Filter.in_(
      'members',
      [StreamChat.of(context).currentUser!.id],
    ),
    sort: const [SortOption('last_message_at')],
    limit: 20,
  );

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              child: Image.asset(
                "assets/images/sample/teacher.jpg",
                width: 30,
                height: 30,
              ),
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: Icon(
              FeatherIcons.search,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Icon(
              FeatherIcons.moreVertical,
            ),
          ),
        ],
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
