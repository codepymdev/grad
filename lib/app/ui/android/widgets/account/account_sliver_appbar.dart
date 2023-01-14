import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad/app/core/constants/asset_path.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/home/flexible_space.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSliverAppBar extends StatelessWidget {
  const AccountSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.green,
      pinned: true,
      expandedHeight: 180.h,
      floating: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(
            right: 20.w,
            top: 10.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "${currentDate()['time']},",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                "${currentDate()['day']}",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Badge(
                badgeContent: Text(
                  "0",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: SvgPicture.asset(
                  BELL,
                  color: Colors.white,
                  width: 25.w,
                ),
              ),
            ],
          ),
        ),
      ],
      forceElevated: false,
      flexibleSpace: HomeFlexibleSpace(),
    );
  }
}
