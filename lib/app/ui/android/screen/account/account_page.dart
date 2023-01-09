import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:grad/app/controller/account/account_controller.dart';
import 'package:grad/app/ui/android/widgets/account/account_section.dart';
import 'package:grad/app/ui/android/widgets/account/account_sliver_appbar.dart';
import 'package:grad/app/ui/android/widgets/account/app_version.dart';
import 'package:grad/app/ui/android/widgets/account/quick_recent_activity.dart';
import 'package:grad/app/ui/android/widgets/home/quicktasks.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Account"),
    );
  }
}
// class AccountPage extends GetView<AccountController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           ///
//           /// account sliver app bar
//           ///
//           AccountSliverAppBar(),

//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 Obx(() {
//                   if (controller.loading.value) {
//                     return Container(
//                       child: Center(child: CircularProgressIndicator()),
//                     );
//                   } else {
//                     return Column(
//                       children: [
//                         ///
//                         /// Account Header info
//                         ///
//                         QuickTasks(),

//                         ///
//                         /// Recent Activity
//                         ///
//                         QuickRecentActivity(),

//                         ///
//                         /// Account
//                         ///
//                         AccountSection(),

//                         ///
//                         /// App About and version
//                         ///
//                         AppAboutVersion(),
//                       ],
//                     );
//                   }
//                 }),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
