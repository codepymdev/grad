import 'package:flutter/material.dart';
import 'package:grad/app/data/services/GetService.dart';
import 'package:grad/app/data/services/StreamService.dart';
import 'package:grad/app/ui/android/screen/chats/channelListPage.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Chat"),
      ),
    );
  }
}

// class ChatPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: StreamChat(
//         client: getIt<StreamService>().client,
//         child: ChannelListPage(),
//       ),
//     );
//   }
// }
