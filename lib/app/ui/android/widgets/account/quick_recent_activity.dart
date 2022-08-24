import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:grad/app/controller/account/account_controller.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 50.0;

class QuickRecentActivity extends GetView<AccountController> {
  const QuickRecentActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> activities = controller.activities;
    return Container(
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
        top: 10,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0,
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 10,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Activities".toUpperCase(),
                  ),
                  Text(
                    "See All".toUpperCase(),
                  ),
                ],
              ),
              Divider(),
              Container(
                child: Timeline.tileBuilder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  theme: TimelineThemeData(
                    nodePosition: 0,
                    connectorTheme: ConnectorThemeData(
                      thickness: 3.0,
                      color: Color(0xffd3d3d3),
                    ),
                    indicatorTheme: IndicatorThemeData(
                      size: 15.0,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  builder: TimelineTileBuilder.connected(
                    contentsBuilder: (_, __) =>
                        _EmptyContents(data: activities[__]),
                    connectorBuilder: (_, index, __) {
                      return SolidLineConnector(
                          color: Color.fromARGB(255, 210, 230, 217));
                    },
                    indicatorBuilder: (_, index) {
                      switch (activities[index]['type']) {
                        case "reset_password":
                        case "change_password":
                          return DotIndicator(
                            color: Color.fromARGB(255, 106, 142, 209),
                            child: Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 10.0,
                            ),
                          );
                        case "login":
                          return DotIndicator(
                            color: Color.fromARGB(255, 1, 4, 14),
                            child: Icon(
                              Icons.check_box,
                              size: 10.0,
                              color: Colors.yellow,
                            ),
                          );

                        default:
                          return OutlinedDotIndicator(
                            color: Color(0xffbabdc0),
                            backgroundColor: Color(0xffe6e7e9),
                          );
                      }
                    },
                    itemExtentBuilder: (_, __) => kTileHeight,
                    itemCount: activities.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyContents extends StatelessWidget {
  final data;
  _EmptyContents({required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.0,
        bottom: 5,
      ),
      padding: EdgeInsets.all(
        5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Color.fromARGB(255, 247, 248, 252),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "${data['title']}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("${data['description']}"),
        ],
      ),
    );
  }
}
