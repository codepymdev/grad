// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:grad/app/data/services/StreamService.dart';
// import 'package:grad/app/ui/android/widgets/chat/conversation.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// class ChatPage extends StatefulWidget {
//   /// Instance of [StreamChatClient] we created earlier. This contains information about
//   /// our application and connection state.
//   final StreamChatClient client;

//   ChatPage({
//     required this.client,
//   });

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   Channel? channel;
//   @override
//   void initState() {
//     super.initState();
//     createChannel();
//   }

//   createChannel() async {
//     final _channel = await StreamService.instance.createChat();
//     setState(() {
//       channel = _channel;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return channel == null
//         ? Center(
//             child: CircularProgressIndicator(),
//           )
//         : StreamChannel(
//             channel: channel!,
//             child: ChannelListPage(),
//           );
//   }

//   Scaffold newMethod(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Theme.of(context).primaryColorDark,
//         leading: Container(
//           padding: EdgeInsets.all(10),
//           child: Badge(
//             badgeColor: Colors.green,
//             toAnimate: false,
//             position: BadgePosition(
//               bottom: 0,
//               start: 5,
//             ),
//             child: ClipOval(
//               child: Image.asset(
//                 "assets/images/sample/teacher.jpg",
//                 width: 30,
//                 height: 30,
//               ),
//             ),
//           ),
//         ),
//         actions: [
//           Container(
//             margin: EdgeInsets.all(10),
//             child: Icon(
//               FeatherIcons.search,
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.all(10),
//             child: Icon(
//               FeatherIcons.moreVertical,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: ListView.separated(
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: 16,
//           shrinkWrap: true,
//           separatorBuilder: (BuildContext context, int index) => Container(),
//           itemBuilder: (BuildContext context, int index) {
//             return Conversation();
//           },
//         ),
//       ),
//     );
//   }
// }

// class ChannelListPage extends StatelessWidget {
//   const ChannelListPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ChannelsBloc(
//         child: ChannelListView(
//           filter: Filter.in_(
//             'members',
//             [StreamChat.of(context).currentUser!.id],
//           ),
//           channelPreviewBuilder: _channelPreviewBuilder,
//           sort: [SortOption('last_message_at')],
//           limit: 20,
//           channelWidget: ChannelPage(),
//         ),
//       ),
//     );
//   }

//   Widget _channelPreviewBuilder(BuildContext context, Channel channel) {
//     final lastMessage = channel.state?.messages.reversed.firstWhere(
//       (message) => !message.isDeleted,
//     );

//     final subtitle = lastMessage == null ? 'nothing yet' : lastMessage.text!;
//     final opacity = (channel.state?.unreadCount ?? 0) > 0 ? 1.0 : 0.5;

//     final theme = StreamChatTheme.of(context);

//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => StreamChannel(
//               channel: channel,
//               child: const ChannelPage(),
//             ),
//           ),
//         );
//       },
//       leading: StreamChannelAvatar(
//         channel: channel,
//       ),
//       title: StreamChannelName(
//         channel: channel,
//         textStyle: theme.channelPreviewTheme.titleStyle!.copyWith(
//           color: theme.colorTheme.textHighEmphasis.withOpacity(opacity),
//         ),
//       ),
//       subtitle: Text(subtitle),
//       trailing: channel.state!.unreadCount > 0
//           ? CircleAvatar(
//               radius: 10,
//               child: Text(channel.state!.unreadCount.toString()),
//             )
//           : const SizedBox(),
//     );
//   }
// }

// class ChannelPage extends StatelessWidget {
//   const ChannelPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const StreamChannelHeader(),
//       body: Column(
//         children: const <Widget>[
//           Expanded(
//             child: StreamMessageListView(),
//           ),
//           StreamMessageInput(),
//         ],
//       ),
//     );
//   }
// }
