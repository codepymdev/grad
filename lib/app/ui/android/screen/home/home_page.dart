import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/home/home_controller.dart';
import 'package:grad/app/core/constants/asset_path.dart';
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
                      "Wed",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "10 Oct",
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

class MenuOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'This is a nice overlay',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
            RaisedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Dismiss'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
