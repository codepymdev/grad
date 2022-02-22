import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/chat/conversation_controller.dart';

class ConversationPage extends GetView<ConversationController> {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: Container(
        child: Text("Conversation here"),
      ),
    );
  }
}
