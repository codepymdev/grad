import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/core/constants/asset_path.dart';
import 'package:jiffy/jiffy.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

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

List<Tab> staffsTabbar() {
  return [
    Tab(
      child: Text("Teachers"),
    ),
    Tab(
      child: Text("Non teachers"),
    ),
  ];
}

AppBar customAppBar(name) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    title: Text(
      "$name",
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    leading: IconButton(
      icon: Icon(
        FeatherIcons.cornerUpLeft,
        color: Colors.black,
      ),
      onPressed: () => Get.back(),
    ),
  );
}

String getConfigValue(list, key) {
  for (var item in list) {
    if (item['name'] == key) return item['value'] ?? "";
  }
  return "";
}

List<String> yearList() {
  List<String> year = [];
  int latestYear = DateTime.now().year;
  int earlistYear = 2010;
  for (var i = earlistYear; i <= latestYear; i++) {
    year.add("$i/${(i + 1)}");
  }
  return year;
}

String diffDateHuman(x) {
  final ago = DateTime.parse(x);
  return timeago.format(ago, locale: 'en_short');
}

String eventDate(start, end) {
  final dateformat = DateFormat.MMMd();

  final datatimestart = DateTime.parse(start);
  final datetimeend = DateTime.parse(end);
  return dateformat.format(datatimestart) +
      " - " +
      dateformat.format(datetimeend);
}

Icon announcementIcons(type) {
  if (type == "General Announcement") {
    return Icon(
      FeatherIcons.alertTriangle,
      color: Colors.blue,
    );
  } else if (type == "Public Holiday") {
    return Icon(
      FeatherIcons.calendar,
      color: Colors.purple,
    );
  } else if (type == "Mid term break") {
    return Icon(
      FeatherIcons.cloudRain,
      color: Colors.orange,
    );
  } else if (type == "Examination") {
    return Icon(
      FeatherIcons.bookOpen,
      color: Colors.green,
    );
  } else if (type == "School Fees") {
    return Icon(
      FeatherIcons.dollarSign,
      color: Colors.red,
    );
  } else if (type == "PTA Meeting") {
    return Icon(
      FeatherIcons.users,
      color: Colors.black,
    );
  } else if (type == "Others") {
    return Icon(
      FeatherIcons.info,
      color: Colors.red,
    );
  } else if (type == "Result") {
    return Icon(
      FeatherIcons.shield,
      color: Colors.yellow,
    );
  } else {
    return Icon(
      FeatherIcons.database,
      color: Colors.purpleAccent,
    );
  }
}

Icon userStatusIcon(String status) {
  if (status == "1") {
    return Icon(
      FeatherIcons.xCircle,
      color: Color.fromARGB(255, 54, 244, 174),
    );
  } else if (status == "2") {
    return Icon(
      FeatherIcons.checkCircle,
      color: Colors.green,
    );
  } else if (status == "0") {
    return Icon(
      FeatherIcons.userX,
      color: Colors.red,
    );
  } else {
    return Icon(
      FeatherIcons.xCircle,
      color: Colors.red,
    );
  }
}

Icon classSection(String section) {
  if (section == "nursery") {
    return Icon(
      FeatherIcons.gitPullRequest,
      color: Color.fromARGB(255, 64, 129, 250),
    );
  } else if (section == "primary") {
    return Icon(
      FeatherIcons.gitBranch,
      color: Colors.green,
    );
  } else if (section == "junior") {
    return Icon(
      FeatherIcons.gitMerge,
      color: Color.fromARGB(255, 43, 42, 42),
    );
  } else if (section == 'senior') {
    return Icon(
      FeatherIcons.gift,
      color: Color.fromARGB(255, 246, 200, 73),
    );
  } else {
    return Icon(
      FeatherIcons.xCircle,
      color: Colors.red,
    );
  }
}
