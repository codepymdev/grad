import 'package:Grad/app/controller/home/home_controller.dart';
import 'package:Grad/app/controller/others/update-controller.dart';
import 'package:Grad/app/core/constants/asset_path.dart';
import 'package:Grad/app/core/functions/functions.dart';
import 'package:Grad/app/ui/android/screen/menu/calendar/calendar.dart';
import 'package:Grad/app/ui/android/screen/menu/overlay.dart';
import 'package:Grad/app/ui/android/screen/menu/parents/parents.dart';
import 'package:Grad/app/ui/android/screen/menu/users/users.dart';
import 'package:Grad/app/ui/android/widgets/home/announcement.dart';
import 'package:Grad/app/ui/android/widgets/home/flexible_space.dart';
import 'package:Grad/app/ui/android/widgets/home/non_teachers.dart';
import 'package:Grad/app/ui/android/widgets/home/quicktasks.dart';
import 'package:Grad/app/ui/android/widgets/home/school.dart';
import 'package:Grad/app/ui/android/widgets/home/students.dart';
import 'package:Grad/app/ui/android/widgets/home/teachers.dart';
import 'package:Grad/app/ui/android/widgets/home/upcoming_event_list.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    void _showOverlay(BuildContext context) async {
      UpdateController updateController = Get.put(UpdateController());
      await Navigator.of(context).push(MenuOverlay());
      updateController.updateSession();
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
                      "${currentDate()['time']},",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "${currentDate()['day']}",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    badge.Badge(
                      badgeContent: Text(
                        "0",
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
              Obx(() {
                if (controller.loading.value)
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                return Column(
                  children: [
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
                    UpcomingEventList(),

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
                    /// Non teaching
                    ///
                    NonTeachers(),

                    ///
                    /// Parent
                    ///
                    Parents(),

                    ///
                    /// Users
                    ///
                    Users(),
                  ],
                );
              })
            ]),
          ),
        ],
      ),
    );
  }
}
