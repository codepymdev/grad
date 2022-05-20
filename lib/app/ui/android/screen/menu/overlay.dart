import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/home/home_controller.dart';
import 'package:grad/app/ui/android/widgets/menu/admin-menu.dart';
import 'package:grad/app/ui/android/widgets/menu/non-teacher-menu.dart';
import 'package:grad/app/ui/android/widgets/menu/parent-menu.dart';
import 'package:grad/app/ui/android/widgets/menu/student-menu.dart';
import 'package:grad/app/ui/android/widgets/menu/teacher-menu.dart';

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
    HomeController homeController = Get.put(HomeController());
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 50,
                left: 10,
                right: 10,
              ),
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.close,
                size: 20,
              ),
            ),
          ),
          Container(
            child: homeController.user_group.value == "admin"
                ? AdminMenu()
                : homeController.user_group.value == "student"
                    ? StudentMenu()
                    : homeController.user_group.value == "parent"
                        ? ParentMenu()
                        : homeController.user_group.value == "teaching"
                            ? TeacherMenu()
                            : NonTeacherMenu(),
          ),
        ],
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
