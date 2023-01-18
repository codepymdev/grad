import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/menu/classtimetable_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/ios_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddClassTimetable extends StatefulWidget {
  @override
  State<AddClassTimetable> createState() => _AddClassTimetableState();
}

class _AddClassTimetableState extends State<AddClassTimetable> {
  ClassTimetableController c = Get.put(ClassTimetableController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Add Timetable"),
      body: Obx(() {
        if (c.loading.value) {
          return IosLoader();
        }

        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Column(
              children: [
                days(),
                startTime(),
                endTime(),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: c.processing.value
                        ? IosLoader()
                        : Text(
                            "Add TimeTable",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                    onPressed: () async {
                      if (!c.processing.value) {
                        await c.createTimetable();

                        if (c.error.value) {
                          final snackBar = SnackBar(
                            content: Text('${c.msg.value}'),
                            backgroundColor: Colors.red,
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        if (c.success.value) {
                          final snackBar = SnackBar(
                            content: Text('${c.msg.value}'),
                            backgroundColor: Colors.green,
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget endTime() => Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 5.w,
                top: 10.w,
                bottom: 5.w,
              ),
              child: Text(
                "End Time",
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => timePicker(context, "end_time"),
              child: Container(
                padding: EdgeInsets.only(
                  top: 10.w,
                  bottom: 10.w,
                  left: 6.w,
                  right: 6.w,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey[350]!,
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${c.end_time.value}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    Icon(
                      FeatherIcons.clock,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget startTime() => Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 5.w,
                top: 10.w,
                bottom: 5.w,
              ),
              child: Text(
                "Start Time",
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => timePicker(context, "start_time"),
              child: Container(
                padding: EdgeInsets.only(
                  top: 10.w,
                  bottom: 10.w,
                  left: 6.w,
                  right: 6.w,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey[350]!,
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${c.start_time.value}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    Icon(
                      FeatherIcons.clock,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget days() => Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              isExpanded: true,
              hint: Text("Day"),
              value: c.days.value,
              onChanged: (String? value) {
                if (value != null) {
                  c.updateDays(value);
                }
              },
              items: <String>[
                'Select day',
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
            ),
          ],
        ),
      );
  Future<void> timePicker(context, String type) async {
    final TimeOfDay? picked_s = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );

    if (picked_s != null) {
      String picked = "${picked_s.hour}:${picked_s.minute}";
      String picked_x =
          "${picked_s.hour}:${picked_s.minute} ${picked_s.period.name}";
      c.selectTime(picked, picked_x, type);
    }
  }
}
