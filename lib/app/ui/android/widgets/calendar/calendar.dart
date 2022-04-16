import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:grad/app/controller/calendar/calendar_controller.dart';
import 'package:grad/app/core/constants/app_constants.dart';
import 'package:table_calendar/table_calendar.dart';

late var events;

class Calendar extends GetView<CalendarController> {
  const Calendar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: Obx(() {
        if (controller.loading.value) return Container();
        events = controller.upcoming_events;
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 0,
          child: TableCalendar(
            locale: 'en_US',
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: DateTime.now(),
            availableGestures: AvailableGestures.horizontalSwipe,
            eventLoader: _getEventsForDay,
            calendarStyle: CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            calendarFormat: controller.calendarformat.value!,
            onFormatChanged: (format) async {
              await controller.changeCalenderFormat(format);
            },
          ),
        );
      }),
    );
  }

  List<dynamic> _getEventsForDay(DateTime day) {
    List<dynamic> _return = [];
    for (var i = 0; i < events.length; i++) {
      DateTime _datetime = DateTime.parse(events[i]['start_date']);
      if (day.day == _datetime.day && day.month == _datetime.month) {
        _return.add(events[i]['title']);
      }
    }
    return _return;
  }
}
