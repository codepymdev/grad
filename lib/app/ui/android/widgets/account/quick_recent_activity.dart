import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 50.0;

class QuickRecentActivity extends StatelessWidget {
  const QuickRecentActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = _TimelineStatus.values;
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
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    "See All".toUpperCase(),
                    style: Theme.of(context).textTheme.subtitle2,
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
                    contentsBuilder: (_, __) => _EmptyContents(),
                    connectorBuilder: (_, index, __) {
                      if (index == 0) {
                        return SolidLineConnector(color: Color(0xff6ad192));
                      } else {
                        return SolidLineConnector();
                      }
                    },
                    indicatorBuilder: (_, index) {
                      switch (data[index]) {
                        case _TimelineStatus.done:
                          return DotIndicator(
                            color: Color(0xff6ad192),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 10.0,
                            ),
                          );
                        case _TimelineStatus.sync:
                          return DotIndicator(
                            color: Color(0xff193fcc),
                            child: Icon(
                              Icons.sync,
                              size: 10.0,
                              color: Colors.white,
                            ),
                          );
                        case _TimelineStatus.inProgress:
                          return OutlinedDotIndicator(
                            color: Color(0xffa7842a),
                            borderWidth: 2.0,
                            backgroundColor: Color(0xffebcb62),
                          );
                        case _TimelineStatus.todo:
                        default:
                          return OutlinedDotIndicator(
                            color: Color(0xffbabdc0),
                            backgroundColor: Color(0xffe6e7e9),
                          );
                      }
                    },
                    itemExtentBuilder: (_, __) => kTileHeight,
                    itemCount: 4,
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
            "You created a new event",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("AppFlowy is an open-source "),
        ],
      ),
    );
  }
}

enum _TimelineStatus {
  done,
  sync,
  inProgress,
  todo,
}

// extension on _TimelineStatus {
//   bool get isInProgress => this == _TimelineStatus.inProgress;
// }
