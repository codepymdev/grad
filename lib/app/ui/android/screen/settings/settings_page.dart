import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/settings/settings_controller.dart';
import 'package:grad/app/core/constants/asset_path.dart';

class SettingsPage extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
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
            ListTile(
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
                  "AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations. Built with Flutter and Rust."),
            ),
            Divider(),
            ListTile(
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
                  "AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations. Built with Flutter and Rust."),
            ),
            Divider(),
            ListTile(
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
                  "AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations. Built with Flutter and Rust."),
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset(
                STAMP,
                width: 30,
              ),
              title: Text(
                "Stamp",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                  "AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations. Built with Flutter and Rust."),
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset(
                E_TEST,
                width: 30,
              ),
              title: Text(
                "E-test",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                  "AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations. Built with Flutter and Rust."),
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset(
                CAMPUS,
                width: 30,
              ),
              title: Text(
                "Campus",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                  "AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations. Built with Flutter and Rust."),
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset(
                SUBJECTS,
                width: 30,
              ),
              title: Text(
                "Subject",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                  "AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations. Built with Flutter and Rust."),
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset(
                CLASSES,
                width: 30,
              ),
              title: Text(
                "Classes",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                  "AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations. Built with Flutter and Rust."),
            ),
            Divider(),
            ListTile(
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
              subtitle: Text(
                  "AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations. Built with Flutter and Rust."),
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset(
                THEME,
                width: 30,
              ),
              title: Text(
                "Theme",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                  "AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations. Built with Flutter and Rust."),
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset(
                PASSWORD,
                width: 30,
              ),
              title: Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                  "AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations. Built with Flutter and Rust."),
            ),
            Divider(),
            ListTile(
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
              subtitle: Text(
                  "AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations. Built with Flutter and Rust."),
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
              subtitle: Text(
                  "AppFlowy is an open-source alternative to Notion. You are in charge of your data and customizations. Built with Flutter and Rust."),
            ),
          ],
        ),
      ),
    );
  }
}
