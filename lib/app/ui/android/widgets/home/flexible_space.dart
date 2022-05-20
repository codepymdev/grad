import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:grad/app/controller/home/home_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';

class HomeFlexibleSpace extends GetView<HomeController> {
  const HomeFlexibleSpace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //get the opacity
        final opacity = getCollapseOpacity(context);
        return Obx(() {
          ///
          /// user data
          ///
          var user = controller.user;
          if (user.isEmpty) return Container();

          return Stack(
            children: [
              Opacity(
                opacity: opacity,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 25,
                  ),
                  child: Row(
                    children: [
                      ClipOval(
                        child: CustomNetworkImage(
                          url: "${user['avatar']}",
                          wd: 80,
                          ht: 80,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Text(
                                    "${greetings()['greeting']}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                    "${greetings()['icon']}",
                                    width: 30,
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "${user['first_name']} ${user['last_name']}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                user['type'] == 'student'
                                    ? "${user['reg_no']}"
                                    : "${user['email']}",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Opacity(
                opacity: 1 - opacity,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 50,
                    top: 10,
                  ),
                  child: Row(
                    children: [
                      ClipOval(
                        child: CustomNetworkImage(
                          url: "${user['avatar']}",
                          wd: 40,
                          ht: 40,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${user['first_name']} ${user['last_name']}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        });
      },
    );
  }
}
