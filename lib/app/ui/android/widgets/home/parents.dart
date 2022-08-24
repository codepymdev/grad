import 'package:grad/app/controller/home/home_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class Parents extends StatefulWidget {
  const Parents({
    Key? key,
  }) : super(key: key);

  @override
  State<Parents> createState() => _ParentsState();
}

class _ParentsState extends State<Parents> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    List<dynamic> users = homeController.parents;
    if (users.isEmpty) return Container();
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
                    "Parents".toUpperCase(),
                  ),
                  Text(
                    "See All".toUpperCase(),
                  ),
                ],
              ),
              Divider(),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => Divider(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            ClipOval(
                              child: CustomNetworkImage(
                                ht: 40,
                                url: "${users[index]['avatar']}",
                                wd: 40,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${users[index]['first_name']} ${users[index]['last_name']} ${users[index]['middle_name']}",
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "${users[index]['email']}",
                                    maxLines: 1,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  await createChannel(context,
                                      "${chatStreamId(homeController.school.value, users[index]['id'])}");
                                },
                                child: Container(
                                  child: Icon(
                                    FeatherIcons.messageCircle,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
