import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/navigation/navigation_controller.dart';
import 'package:grad/app/ui/android/screen/account/account_page.dart';
import 'package:grad/app/ui/android/screen/calendar/calendar_page.dart';
import 'package:grad/app/ui/android/screen/chats/chatsPage.dart';
import 'package:grad/app/ui/android/screen/home/home_page.dart';
import 'package:grad/app/ui/android/screen/settings/settings_page.dart';

class Navigation extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomePage(),
              ChatPage(),
              CalendarPage(),
              SettingsPage(),
              AccountPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 2.0,
            selectedItemColor: Theme.of(context).iconTheme.color,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: controller.changeTabIndex,
            items: BottomNavList,
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> get BottomNavList {
    return [
      BottomNavigationBarItem(
        label: "",
        icon: Icon(
          FeatherIcons.home,
        ),
        activeIcon: Icon(
          FeatherIcons.home,
          color: Colors.green,
        ),
      ),
      BottomNavigationBarItem(
        label: "",
        icon: Badge(
          badgeColor: Colors.green,
          badgeContent: Text(
            "${controller.messagecount}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Icon(
            FeatherIcons.messageCircle,
          ),
        ),
        activeIcon: Icon(
          FeatherIcons.messageCircle,
          color: Colors.green,
        ),
      ),
      BottomNavigationBarItem(
        label: "",
        icon: Icon(
          FeatherIcons.calendar,
        ),
        activeIcon: Icon(
          FeatherIcons.calendar,
          color: Colors.green,
        ),
      ),
      BottomNavigationBarItem(
        label: "",
        icon: Icon(
          FeatherIcons.settings,
        ),
        activeIcon: Icon(
          FeatherIcons.settings,
          color: Colors.green,
        ),
      ),
      BottomNavigationBarItem(
        label: "",
        icon: Icon(
          FeatherIcons.user,
        ),
        activeIcon: Icon(
          FeatherIcons.user,
          color: Colors.green,
        ),
      ),
    ];
  }
}
