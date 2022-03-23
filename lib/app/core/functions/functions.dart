import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:grad/app/core/constants/asset_path.dart';
import 'package:jiffy/jiffy.dart';

double getCollapseOpacity(context) {
  final settings =
      context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
  final deltaExtent = settings.maxExtent - settings.minExtent;
  final t = (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
      .clamp(0.0, 1.0);
  final fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
  const fadeEnd = 1.0;
  final opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);
  return opacity;
}

Map<String, dynamic> greetings() {
  String gt = "";
  String icon = "";
  var hour = DateTime.now().hour;
  if (hour <= 12) {
    gt = 'Good Morning';
    icon = SUNRISE;
  } else if ((hour > 12) && (hour <= 16)) {
    gt = 'Good Afternoon';
    icon = SUNRISE;
  } else if ((hour > 16) && (hour < 20)) {
    gt = 'Good Evening';
    icon = SUNSET;
  } else {
    gt = 'Good Night';
    icon = NIGHT;
  }
  return {
    "greeting": gt,
    "icon": icon,
  };
}

Map<String, dynamic> currentDate() {
  String time = Jiffy().jm;
  String day = Jiffy().E;

  return {
    "day": day,
    "time": time,
  };
}

List<Tab> eventTabbar() {
  return [
    Tab(
      child: Text("Upcoming Events"),
    ),
    Tab(
      child: Text("Passed Events"),
    ),
  ];
}
