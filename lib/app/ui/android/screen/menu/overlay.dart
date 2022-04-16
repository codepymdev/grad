import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grad/app/core/constants/asset_path.dart';

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
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed("/classes"),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          CLASS,
                          width: 60,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Classes",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed("/subjects"),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          BOOKS,
                          width: 60,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Subjects",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed("/students"),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          STUDENT,
                          width: 60,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Students",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed("/parents"),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          PARENT,
                          width: 60,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Parents",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed("/staffs"),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          TEACHER,
                          width: 60,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Staffs",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        QUIZ,
                        width: 60,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "CBT",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        TIMESHEETS,
                        width: 60,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Activities",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        EXAM,
                        width: 60,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Results",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        REPORT,
                        width: 60,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Reports",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed("/users"),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          USERS,
                          width: 60,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Users",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed("/announcements"),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ANNOUNCEMENT,
                          width: 60,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Announcement",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed("/calendar"),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          CALENDAR,
                          width: 60,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Calendar",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
