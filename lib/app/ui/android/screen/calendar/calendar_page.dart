import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/calendar/calendar_controller.dart';
import 'package:grad/app/controller/others/update-controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/calendar/passed_events.dart';
import 'package:grad/app/ui/android/widgets/calendar/upcoming_events.dart';

class CalendarPage extends GetView<CalendarController> {
  @override
  Widget build(BuildContext context) {
    List<Tab> _tab = eventTabbar();
    return DefaultTabController(
      initialIndex: 0,
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Events",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColorDark,
          bottom: TabBar(
            isScrollable: false,
            tabs: _tab,
          ),
        ),
        body: TabBarView(
          children: [
            ///
            ///Upcoming events
            ///
            UpcomingEvents(),

            ///
            ///Passed Events
            ///
            PassedEvents(),
          ],
        ),
        floatingActionButton: controller.user_group.value == "admin"
            ? FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () async {
                  UpdateController updateController =
                      Get.put(UpdateController());

                  await Get.toNamed("new-event");
                  updateController.updateSession();
                },
                child: Icon(FeatherIcons.plus),
              )
            : Container(),
      ),
    );
  }
}
