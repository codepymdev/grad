import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad/app/core/constants/asset_path.dart';
import 'package:grad/app/ui/android/widgets/home/flexible_space.dart';

class AccountSliverAppBar extends StatelessWidget {
  const AccountSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColorDark,
      pinned: true,
      expandedHeight: 180,
      floating: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 20,
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Wed",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "10 Oct",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Badge(
                badgeContent: Text(
                  "2",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: SvgPicture.asset(
                  BELL,
                  color: Colors.white,
                  width: 25,
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
