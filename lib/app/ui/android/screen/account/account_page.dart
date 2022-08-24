import 'package:grad/app/controller/account/account_controller.dart';
import 'package:grad/app/ui/android/widgets/account/account_section.dart';
import 'package:grad/app/ui/android/widgets/account/account_sliver_appbar.dart';
import 'package:grad/app/ui/android/widgets/account/app_version.dart';
import 'package:grad/app/ui/android/widgets/account/quick_recent_activity.dart';
import 'package:grad/app/ui/android/widgets/custom/iosLoader.dart';
import 'package:grad/app/ui/android/widgets/home/quicktasks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  AccountController accountController = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ///
          /// account sliver app bar
          ///
          AccountSliverAppBar(),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                Obx(() {
                  if (accountController.loading.value) {
                    return Container(
                      child: Center(
                        child: IosLoader(),
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        ///
                        /// Account Header info
                        ///
                        QuickTasks(),

                        ///
                        /// Recent Activity
                        ///
                        QuickRecentActivity(),

                        ///
                        /// Account
                        ///
                        AccountSection(),

                        ///
                        /// App About and version
                        ///
                        AppAboutVersion(),
                      ],
                    );
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
