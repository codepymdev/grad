import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/calendar/new_event_controller.dart';

class NewEvent extends GetView<NewEventController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("New Event View")),
    );
  }
}
