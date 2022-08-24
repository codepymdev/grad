import 'package:flutter/material.dart';

import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/staffs/non-teachers.dart';
import 'package:grad/app/ui/android/widgets/staffs/teachers.dart';

class Staffs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Tab> _tab = staffsTabbar();
    return DefaultTabController(
      initialIndex: 0,
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Staffs"),
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColorDark,
          bottom: TabBar(
            isScrollable: false,
            tabs: _tab,
          ),
        ),
        body: TabBarView(
          children: [
            ///
            ///Teachers
            ///
            Teachers(),

            ///
            ///Non teachers
            ///
            NonTeachers(),
          ],
        ),
        // floatingActionButton: _buildFloatActionButton(),
      ),
    );
  }
}
