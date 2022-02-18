import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/navigation/navigation_controller.dart';
import 'package:grad/app/ui/android/screen/home/home_page.dart';

class Navigation extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return SafeArea(
      child: Scaffold(
        body: HomePage(),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 2.0,
          selectedItemColor: Theme.of(context).iconTheme.color,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                FeatherIcons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                FeatherIcons.calendar,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                FeatherIcons.book,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Badge(
                badgeContent: Text(
                  "2",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Icon(
                  FeatherIcons.messageCircle,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                FeatherIcons.settings,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
