import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Grad/app/controller/calendar/calendar_controller.dart';
import 'package:Grad/app/core/constants/app_constants.dart';
import 'package:table_calendar/table_calendar.dart';

late var events;

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
  }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController calendarController = Get.put(CalendarController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: Obx(() {
        if (calendarController.loading.value) return Container();
        events = calendarController.upcoming_events;
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
            calendarFormat: calendarController.calendarformat.value!,
            onFormatChanged: (format) async {
              await calendarController.changeCalenderFormat(format);
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
