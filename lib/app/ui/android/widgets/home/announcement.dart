import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad/app/core/constants/asset_path.dart';

class Announcement extends StatelessWidget {
  const Announcement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
        top: 5,
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(15),
      //   border: Border.all(
      //     color: Color.fromARGB(255, 219, 218, 218),
      //     width: 0.5,
      //   ),
      // ),
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
                  Row(
                    children: [
                      SvgPicture.asset(
                        ANNOUNCEMENT,
                        width: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Announcement",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  Icon(
                    FeatherIcons.minimize2,
                  ),
                ],
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF94892),
                ),
                child: Text(
                  "Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt, labore quia! Impedit tempora, at facere rerum illum fugit! Quia consequatur accusantium quasi voluptas mollitia perspiciatis beatae voluptates esse distinctio. Quasi?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
