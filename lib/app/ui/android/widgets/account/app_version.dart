import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Grad/app/core/constants/asset_path.dart';

class AppAboutVersion extends StatelessWidget {
  const AppAboutVersion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
        top: 30,
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "Grad",
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Powered by ",
              ),
              SizedBox(
                width: 2,
              ),
              SvgPicture.asset(
                HEART,
                width: 14,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Codepym",
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            ".v 1.0.0",
          ),
        ],
      ),
    );
  }
}
