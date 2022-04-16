import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class CreateNewEvent extends StatelessWidget {
  const CreateNewEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Color.fromARGB(255, 230, 238, 243),
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FeatherIcons.plus,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Create New Event",
              ),
            ],
          ),
          onPressed: () => Get.toNamed("new-event"),
        ),
      ),
    );
  }
}
