import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grad/app/core/constants/asset_path.dart';
import 'package:grad/app/ui/android/screen/chats/conversation_page.dart';

class Conversation extends StatelessWidget {
  const Conversation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(ConversationPage()),
      child: Container(
        margin: EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Color.fromARGB(255, 230, 238, 243),
          elevation: 0,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 20,
                    top: 20,
                  ),
                  child: Badge(
                    badgeColor: Colors.green,
                    toAnimate: false,
                    position: BadgePosition(
                      bottom: 0,
                      start: 5,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/sample/teacher.jpg",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Arafat Benson",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          SEEN,
                          width: 15,
                          height: 15,
                        ),
                        Expanded(
                          child: Text(
                            "sef deofioi foido fidif oiodf dfoinfo ioidf",
                            maxLines: 1,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      "9:51 pm",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Text("3"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
