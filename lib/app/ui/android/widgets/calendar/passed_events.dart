import 'package:flutter/material.dart';
import 'package:Grad/app/ui/android/widgets/calendar/passed_event_list.dart';

class PassedEvents extends StatefulWidget {
  @override
  State<PassedEvents> createState() => _PassedEventsState();
}

class _PassedEventsState extends State<PassedEvents> {
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
