import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad/app/core/constants/asset_path.dart';
import 'package:grad/app/core/functions/functions.dart';

class HomeFlexibleSpace extends StatelessWidget {
  const HomeFlexibleSpace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //get the opacity
        final opacity = getCollapseOpacity(context);
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
                      child: Image.asset(
                        "assets/images/sample/teacher.jpg",
                        width: 80,
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
                                  "Good Afternoon",
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
                                  SUNRISE,
                                  width: 30,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Benson Arafat",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "benpaul320@gmail.com",
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
                      child: Image.asset(
                        "assets/images/sample/teacher.jpg",
                        width: 40,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Arafat Benson",
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
      },
    );
  }
}
