import 'package:grad/app/core/constants/app_constants.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamService {
  StreamChatClient client = StreamChatClient(
    STREAM_API_KEY,
    logLevel: ISDEBUGMODE ? Level.INFO : Level.OFF,
  );

  Future<Channel> createChannel(members) async {
    final channel =
        client.channel('messaging', extraData: {"members": members});
    await channel.watch();
    return channel;
  }
}
