import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/calendar/calendar_controller.dart';
import 'package:Grad/app/ui/android/widgets/calendar/calendar.dart';

import 'package:Grad/app/ui/android/widgets/home/upcoming_event_list.dart';

class UpcomingEvents extends StatefulWidget {
  @override
  State<UpcomingEvents> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {
  CalendarController calendarController = Get.put(CalendarController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Obx(() {
          if (calendarController.loading.value)
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          return Column(
            children: [
              ///
              /// Calender
              ///
              Calendar(),

              ///
              ///Event List
              ///
              UpcomingEventList(),
            ],
          );
        }),
      ),
    );
  }
}
