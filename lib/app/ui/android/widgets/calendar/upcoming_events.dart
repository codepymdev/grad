import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/ui/android/screen/calendar/new_event.dart';
import 'package:grad/app/ui/android/widgets/calendar/calendar.dart';
import 'package:grad/app/ui/android/widgets/home/event_list.dart';

class UpcomingEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            ///
            /// Create Events
            ///
            Container(
              margin: EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Color.fromARGB(255, 230, 238, 243),
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FeatherIcons.plus,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Create New Event",
                      ),
                    ],
                  ),
                  onPressed: () => Get.to(NewEvent()),
                ),
              ),
            ),

            ///
            /// Calender
            ///
            Calendar(),

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
