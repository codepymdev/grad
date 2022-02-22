import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:grad/app/controller/calendar/calendar_controller.dart';

class CalendarPage extends GetView<CalendarController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Calendar"),
    );
  }
}
