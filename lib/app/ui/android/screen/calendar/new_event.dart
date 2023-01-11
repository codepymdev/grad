import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/calendar/new_event_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/ios_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewEvent extends GetView<NewEventController> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final TextEditingController urlcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Create new event"),
      body: SingleChildScrollView(
        child: Obx(
          () => Container(
            margin: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
              top: 5.h,
              bottom: 15.h,
            ),
            child: Column(
              children: [
                _title(),
                _startdate(context),
                _enddate(context),
                _description(),
                _url(),
                Container(
                  margin: EdgeInsets.only(
                    top: 20.h,
                  ),
                  width: double.infinity,
                  height: 50.h,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: controller.processing.value
                        ? IosLoader(color: Colors.white)
                        : Text(
                            "Create Event",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                    onPressed: () async {
                      if (!controller.processing.value) {
                        await controller.create_event({
                          "title": titleController.text,
                          "description": descriptioncontroller.text,
                          "url": urlcontroller.text,
                        });

                        if (controller.error.value) {
                          final snackBar = SnackBar(
                            content: Text('${controller.error_msg.value}'),
                            backgroundColor: Colors.red,
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        if (controller.success.value) {
                          final snackBar = SnackBar(
                            content: Text('${controller.success_msg.value}'),
                            backgroundColor: Colors.green,
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Get.back();
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      margin: EdgeInsets.all(5.w),
      child: TextField(
        controller: titleController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[350]!,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[350]!,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[200]!,
            ),
            borderRadius: BorderRadius.circular(5.0.w),
          ),
          labelText: 'Title',
        ),
      ),
    );
  }

  Widget _description() {
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: descriptioncontroller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[350]!,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[350]!,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[200]!,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          labelText: 'Description',
        ),
      ),
    );
  }

  Widget _url() {
    return Container(
      margin: EdgeInsets.all(5.w),
      child: TextField(
        controller: urlcontroller,
        keyboardType: TextInputType.url,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[350]!,
            ),
            borderRadius: BorderRadius.circular(5.0.w),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[350]!,
            ),
            borderRadius: BorderRadius.circular(5.0.w),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[200]!,
            ),
            borderRadius: BorderRadius.circular(5.0.w),
          ),
          labelText: 'URL',
        ),
      ),
    );
  }

  Widget _startdate(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 5.w,
            top: 10.w,
            bottom: 5.w,
          ),
          child: Text(
            "Start Date",
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate(context, "start_date"),
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
                  " ${controller.start_date.value}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Icon(
                  FeatherIcons.calendar,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _enddate(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 5.w,
            top: 10.w,
            bottom: 5.w,
          ),
          child: Text(
            "End Date",
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate(context, "end_date"),
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
                  " ${controller.end_date.value}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                Icon(
                  FeatherIcons.calendar,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context, String type) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: controller.initial_date.value!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != controller.initial_date.value) {
      controller.selectDate(picked, type);
    }
  }
}
