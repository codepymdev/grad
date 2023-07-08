import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/settings/settings_controller.dart';
import 'package:grad/app/core/constants/asset_path.dart';
import 'package:grad/app/ui/android/widgets/account/app_version.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SettingsController settingsController = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 5,
          bottom: 10,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            settingsController.user_group.value == "admin"
                ? Column(
                    children: [
                      ListTile(
                        onTap: () => Get.toNamed("/school-configuration"),
                        leading: SvgPicture.asset(
                          SCHOOL_CONFIG,
                          width: 30,
                        ),
                        title: Text(
                          "School Configuration",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                            "Set the school name, school details, school moto, school email, school tel etc.."),
                      ),
                      Divider(),
                    ],
                  )
                : Container(),

            settingsController.user_group.value == "admin"
                ? Column(
                    children: [
                      ListTile(
                        onTap: () => Get.toNamed("/session"),
                        leading: SvgPicture.asset(
                          SESSION,
                          width: 30,
                        ),
                        title: Text(
                          "Session",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                            "Session Configuration! Set the term and year session"),
                      ),
                      Divider(),
                    ],
                  )
                : Container(),
            settingsController.user_group.value == "admin"
                ? Column(
                    children: [
                      ListTile(
                        onTap: () => Get.toNamed("/term"),
                        leading: SvgPicture.asset(
                          TERM,
                          width: 30,
                        ),
                        title: Text(
                          "Term",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                            "Term begins and end! Set end and begin date of the term."),
                      ),
                    ],
                  )
                : Container(),
            // ListTile(
            //   onTap: () => Get.toNamed("/stamp"),
            //   leading: SvgPicture.asset(
            //     STAMP,
            //     width: 30,
            //   ),
            //   title: Text(
            //     "Stamp",
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //   subtitle: Text(
            //       "Authorized School Stamp! Update or upload the authorized school stamp"),
            // ),
            // Divider(),
            ListTile(
              onTap: () => Get.toNamed("/notification-settings"),
              leading: SvgPicture.asset(
                BELL,
                width: 30,
              ),
              title: Text(
                "Notification",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle:
                  Text("Notification! Control how you receive notifications"),
            ),
            Divider(),
            ListTile(
              onTap: () => Get.toNamed("/bugs"),
              leading: SvgPicture.asset(
                BUG,
                width: 30,
              ),
              title: Text(
                "Report Bug issues",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("Discover bugs? report them to us"),
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset(
                RATE,
                width: 30,
              ),
              title: Text(
                "Rate us",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("Share your review about our app"),
            ),
            Divider(),
            Container(
              child: AppAboutVersion(),
            ),
          ],
        ),
      ),
    );
  }
}
