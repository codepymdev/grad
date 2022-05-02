import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:grad/app/data/services/GetService.dart';
import 'package:grad/app/data/services/StreamService.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamChat(
        client: getIt<StreamService>().client,
        child: ChannelListPage(),
      ),
    );
  }
}

class ChannelListPage extends StatelessWidget {
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
      body: ChannelsBloc(
        child: ChannelListView(
          filter:
              Filter.in_('members', [StreamChat.of(context).currentUser!.id]),
          sort: [SortOption('last_message_at')],
          pagination: PaginationParams(
            limit: 20,
          ),
          channelWidget: ChannelPage(),
        ),
      ),
    );
  }
}

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChannelHeader(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(
              threadBuilder: (_, parentMessage) => ThreadPage(
                parent: parentMessage,
              ),
            ),
          ),
          const MessageInput(),
        ],
      ),
    );
  }
}

class ThreadPage extends StatelessWidget {
  const ThreadPage({
    Key? key,
    this.parent,
  }) : super(key: key);

  final Message? parent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThreadHeader(
        parent: parent!,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(
              parentMessage: parent,
            ),
          ),
          MessageInput(
            parentMessage: parent,
          ),
        ],
      ),
    );
  }
}
