import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/home/home_controller.dart';
import 'package:grad/app/core/constants/asset_path.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/screen/menu/overlay.dart';
import 'package:grad/app/ui/android/widgets/calendar/calendar.dart';
import 'package:grad/app/ui/android/widgets/home/announcement.dart';
import 'package:grad/app/ui/android/widgets/home/event_list.dart';
import 'package:grad/app/ui/android/widgets/home/flexible_space.dart';
import 'package:grad/app/ui/android/widgets/home/parents.dart';
import 'package:grad/app/ui/android/widgets/home/quicktasks.dart';
import 'package:grad/app/ui/android/widgets/home/school.dart';
import 'package:grad/app/ui/android/widgets/home/students.dart';
import 'package:grad/app/ui/android/widgets/home/teachers.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    void _showOverlay(BuildContext context) {
      Navigator.of(context).push(MenuOverlay());
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColorDark,
            pinned: true,
            expandedHeight: 180,
            floating: true,
            leading: IconButton(
              onPressed: () {
                _showOverlay(context);
              },
              icon: SvgPicture.asset(
                MENU,
                color: Colors.white,
                width: 25,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${currentDate()['day']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "${currentDate()['date']}, ${currentDate()['month']}",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Badge(
                      badgeContent: Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: SvgPicture.asset(
                        BELL,
                        color: Colors.white,
                        width: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            forceElevated: false,
            flexibleSpace: HomeFlexibleSpace(),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ///
              /// Announcements
              ///
              Announcement(),

              ///
              /// School
              ///
              School(),

              ///
              /// calendar
              ///
              Calendar(),

              ///
              /// Events
              ///
              EventList(),

              ///
              ///
              ///
              QuickTasks(),

              ///
              /// Students
              ///
              Students(),

              ///
              /// Teacher
              ///
              Teachers(),

              ///
              /// Parent
              ///
              Parents(),
            ]),
          ),
        ],
      ),
    );
  }
}
