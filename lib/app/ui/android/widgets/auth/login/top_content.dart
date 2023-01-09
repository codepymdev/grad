import 'package:flutter/material.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopContent extends StatelessWidget {
  const TopContent({
    Key? key,
    required this.logo,
    required this.name,
  }) : super(key: key);

  final String? logo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            logo == null
                ? Image.asset(
                    "assets/images/logo/logo.png",
                    width: 40.w,
                    height: 40.h,
                  )
                : CustomNetworkImage(
                    url: "$logo",
                    wd: 40.w,
                    ht: 40.h,
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$name",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Let's sign you in.",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 40.sp,
            color: Color.fromARGB(255, 49, 47, 47),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Welcome back",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30.sp,
            color: Color.fromARGB(255, 88, 87, 87),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "You've have missed!",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 28,
            color: Color.fromARGB(255, 88, 87, 87),
          ),
        ),
      ],
    );
  }
}
