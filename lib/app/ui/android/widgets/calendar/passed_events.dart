import 'package:flutter/material.dart';
import 'package:grad/app/ui/android/widgets/home/event_list.dart';

class PassedEvents extends StatelessWidget {
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
            EventList(),
          ],
        ),
      ),
    );
  }
}
