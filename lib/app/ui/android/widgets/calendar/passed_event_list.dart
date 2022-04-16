import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/state_manager.dart';
import 'package:grad/app/controller/calendar/calendar_controller.dart';
import 'package:grad/app/core/constants/asset_path.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';

class PassedEventList extends GetView<CalendarController> {
  const PassedEventList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      child: Obx(
        () {
          if (controller.loading.value) return Container();
          var events = controller.other_events;
          return Column(
            children: [
              for (var i = 0; i < events.length; i++)
                _event(context, events[i]),
            ],
          );
        },
      ),
    );
  }

  Widget _event(BuildContext context, event) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 25,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    TAG,
                    width: 20,
                    // color: Colors.orange,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${eventDate(event['start_date'], event['end_date'])}",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 15,
                ),
                child: Text(
                  "${diffDateHuman(event["created"])}",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),

          //details
          Container(
            padding: EdgeInsets.all(
              12,
            ),
            margin: EdgeInsets.only(
              left: 30,
              right: 10,
              top: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Color.fromARGB(255, 219, 218, 218),
                width: 0.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${event['title']}",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${event['description']}",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: CustomNetworkImage(
                              url: "${event["user"]['avatar']}",
                              ht: 30,
                              wd: 30,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${event['user']['first_name']} ${event['user']['last_name']}",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 35,
                        ),
                        child: Text(
                          "${event['user']['email']}",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
