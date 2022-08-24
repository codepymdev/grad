import 'package:grad/app/controller/calendar/new_event_controller.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class NewEvent extends StatefulWidget {
  @override
  State<NewEvent> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  NewEventController newEventController = Get.put(NewEventController());
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController urlcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "Create new event"),
      body: SingleChildScrollView(
        child: Obx(
          () => Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 5,
              bottom: 15,
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
                    top: 20,
                  ),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(),
                    child: newEventController.processing.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            "Create Event",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    onPressed: () async {
                      if (!newEventController.processing.value) {
                        await newEventController.create_event({
                          "title": titleController.text,
                          "description": descriptioncontroller.text,
                          "url": urlcontroller.text,
                        });

                        if (newEventController.error.value) {
                          final snackBar = SnackBar(
                            content:
                                Text('${newEventController.error_msg.value}'),
                            backgroundColor: Colors.red,
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        if (newEventController.success.value) {
                          final snackBar = SnackBar(
                            content:
                                Text('${newEventController.success_msg.value}'),
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
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      margin: EdgeInsets.all(5),
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
            borderRadius: BorderRadius.circular(5.0),
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
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: urlcontroller,
        keyboardType: TextInputType.url,
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
          padding: const EdgeInsets.only(
            left: 5,
            top: 10,
            bottom: 5,
          ),
          child: Text(
            "Start Date",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate(context, "start_date"),
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 6,
              right: 6,
            ),
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.grey[350]!,
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " ${newEventController.start_date.value}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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
          padding: const EdgeInsets.only(
            left: 5,
            top: 10,
            bottom: 5,
          ),
          child: Text(
            "End Date",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate(context, "end_date"),
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 6,
              right: 6,
            ),
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.grey[350]!,
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " ${newEventController.end_date.value}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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
        initialDate: newEventController.initial_date.value!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != newEventController.initial_date.value) {
      newEventController.selectDate(picked, type);
    }
  }
}
