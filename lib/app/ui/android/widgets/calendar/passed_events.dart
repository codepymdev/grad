import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:grad/app/controller/calendar/calendar_controller.dart';
import 'package:grad/app/ui/android/widgets/calendar/passed_event_list.dart';

class PassedEvents extends GetView<CalendarController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            ///
            ///Create event
            ///

            ///
            ///Event List
            ///
            PassedEventList(),
          ],
        ),
      ),
    );
  }
}
