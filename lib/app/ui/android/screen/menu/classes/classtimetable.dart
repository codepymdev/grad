import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class ClassTimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const List<Tab> tabs = [
      const Tab(text: "Monday"),
      const Tab(text: "Tuesday"),
      const Tab(text: "Wednesday"),
      const Tab(text: "Thursday"),
      const Tab(text: "Friday"),
    ];
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          bottom: TabBar(isScrollable: true, tabs: tabs),
          title: const Text(
            'TimeTable',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              FeatherIcons.cornerUpLeft,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        body: TabBarView(
          children: [
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {},
          child: Icon(
            FeatherIcons.plus,
          ),
        ),
      ),
    );
  }
}
