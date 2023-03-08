import 'package:Grad/app/data/services/GetService.dart';
import 'package:Grad/app/data/services/StreamService.dart';
import 'package:Grad/app/ui/android/screen/chats/channelListPage.dart';
import 'package:flutter/material.dart';

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
