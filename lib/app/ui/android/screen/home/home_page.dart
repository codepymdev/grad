import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/home/home_controller.dart';
import 'package:grad/app/controller/others/update-controller.dart';
import 'package:grad/app/core/constants/asset_path.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/screen/menu/overlay.dart';
import 'package:grad/app/ui/android/widgets/calendar/calendar.dart';
import 'package:grad/app/ui/android/widgets/home/announcement.dart';
import 'package:grad/app/ui/android/widgets/home/upcoming_event_list.dart';
import 'package:grad/app/ui/android/widgets/home/flexible_space.dart';
import 'package:grad/app/ui/android/widgets/home/non_teachers.dart';
import 'package:grad/app/ui/android/widgets/home/parents.dart';
import 'package:grad/app/ui/android/widgets/home/quicktasks.dart';
import 'package:grad/app/ui/android/widgets/home/school.dart';
import 'package:grad/app/ui/android/widgets/home/students.dart';
import 'package:grad/app/ui/android/widgets/home/teachers.dart';
import 'package:grad/app/ui/android/widgets/home/users.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.green,
            pinned: true,
            expandedHeight: 180.h,
            floating: true,
            leading: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                MENU,
                color: Colors.white,
                width: 25.w,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  right: 20.w,
                  top: 10.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${currentDate()['time']},",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      "${currentDate()['day']}",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Badge(
                      badgeContent: Text(
                        "0",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      child: SvgPicture.asset(
                        BELL,
                        color: Colors.white,
                        width: 25.w,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Container(),
    );
  }
}

// class HomePage extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     void _showOverlay(BuildContext context) async {
//       UpdateController updateController = Get.put(UpdateController());
//       await Navigator.of(context).push(MenuOverlay());
//       updateController.updateSession();
//     }

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: Theme.of(context).primaryColorDark,
//             pinned: true,
//             expandedHeight: 180,
//             floating: true,
//             leading: IconButton(
//               onPressed: () {
//                 _showOverlay(context);
//               },
//               icon: SvgPicture.asset(
//                 MENU,
//                 color: Colors.white,
//                 width: 25,
//               ),
//             ),
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                   right: 20,
//                   top: 10,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       "${currentDate()['time']},",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 3,
//                     ),
//                     Text(
//                       "${currentDate()['day']}",
//                       style: TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 8,
//                     ),
//                     Badge(
//                       badgeContent: Text(
//                         "0",
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                       child: SvgPicture.asset(
//                         BELL,
//                         color: Colors.white,
//                         width: 25,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//             forceElevated: false,
//             flexibleSpace: HomeFlexibleSpace(),
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate([
//               Obx(() {
//                 if (controller.loading.value)
//                   return Container(
//                     child: Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   );
//                 return Column(
//                   children: [
//                     ///
//                     /// Announcements
//                     ///
//                     Announcement(),

//                     ///
//                     /// School
//                     ///
//                     School(),

//                     ///
//                     /// calendar
//                     ///
//                     Calendar(),

//                     ///
//                     /// Events
//                     ///
//                     UpcomingEventList(),

//                     ///
//                     ///
//                     ///
//                     QuickTasks(),

//                     ///
//                     /// Students
//                     ///
//                     Students(),

//                     ///
//                     /// Teacher
//                     ///
//                     Teachers(),

//                     ///
//                     /// Non teaching
//                     ///
//                     NonTeachers(),

//                     ///
//                     /// Parent
//                     ///
//                     Parents(),

//                     ///
//                     /// Users
//                     ///
//                     Users(),
//                   ],
//                 );
//               })
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }
