import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/chat/chat_controller.dart';
import 'package:grad/app/ui/android/widgets/chat/conversation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatPage extends GetView<ChatController> {
  /// Instance of [StreamChatClient] we created earlier. This contains information about
  /// our application and connection state.
  final StreamChatClient client;

  /// The channel we'd like to observe and participate.
  final Channel channel;

  ChatPage({
    required this.client,
    required this.channel,
  });
  @override
  Widget build(BuildContext context) {
    return StreamChannel(
      channel: channel,
      child: const ChannelPage(),
    );
  }

  Scaffold newMethod(BuildContext context) {
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
      body: SingleChildScrollView(
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 16,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) => Container(),
          itemBuilder: (BuildContext context, int index) {
            return Conversation();
          },
        ),
      ),
    );
  }
}

/// Displays the list of messages inside the channel
class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StreamChannelHeader(),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: StreamMessageListView(),
          ),
          StreamMessageInput(),
        ],
      ),
    );
  }
}
