import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/settings/settings_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class Notification extends StatefulWidget {
  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  SettingsController settingsController = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Notification"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
            bottom: 15,
          ),
          child: Obx(() {
            if (settingsController.loading.value)
              return Center(
                child: CircularProgressIndicator(),
              );
            return ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text(
                    "App notification",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text("Turn off app notification"),
                  trailing: Switch(
                    value: settingsController.app_notifications.value,
                    onChanged: (bool? newValue) =>
                        settingsController.updateNotification("app", newValue),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Announcement",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text("Turn off announcement"),
                  trailing: Switch(
                    value: settingsController.announcement_notifications.value,
                    onChanged: (bool? newValue) => settingsController
                        .updateNotification("announcement", newValue),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Email notification",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text("Turn off Email notification"),
                  trailing: Switch(
                    value: settingsController.email_notifications.value,
                    onChanged: (bool? newValue) => settingsController
                        .updateNotification("email", newValue),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "SMS notification",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text("Turn off SMS notification"),
                  trailing: Switch(
                    value: settingsController.sms_notifications.value,
                    onChanged: (bool? newValue) =>
                        settingsController.updateNotification("sms", newValue),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
