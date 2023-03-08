import 'package:Grad/app/controller/home/home_controller.dart';
import 'package:Grad/app/core/constants/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

late bool themeMode;

class QuickTasks extends GetView<HomeController> {
  const QuickTasks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      themeMode = true;
    } else {
      themeMode = false;
    }
    return SizedBox(
      height: 130,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: themeMode
                  ? Theme.of(context).primaryColor
                  : Color.fromRGBO(250, 228, 252, 1),
              child: Container(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 8,
                  top: 10,
                ),
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Students".toUpperCase(),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${controller.counter['students']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SvgPicture.asset(
                            STUDENT,
                            width: 70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: themeMode
                  ? Theme.of(context).primaryColor
                  : Color.fromARGB(255, 202, 238, 197),
              child: Container(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 8,
                  top: 10,
                ),
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Teachers".toUpperCase(),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${controller.counter['teaching']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SvgPicture.asset(
                            TEACHER,
                            width: 70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: themeMode
                  ? Theme.of(context).primaryColor
                  : Color.fromARGB(255, 175, 140, 173),
              child: Container(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 8,
                  top: 10,
                ),
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Non teaching".toUpperCase(),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${controller.counter['non_teaching']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SvgPicture.asset(
                            OFFICE,
                            width: 70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: themeMode
                  ? Theme.of(context).primaryColor
                  : Color(0xffE7FBBE),
              child: Container(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 8,
                  top: 10,
                ),
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Parents".toUpperCase(),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${controller.counter['parents']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SvgPicture.asset(
                            PARENT,
                            width: 70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: themeMode
                  ? Theme.of(context).primaryColor
                  : Color.fromARGB(255, 223, 244, 248),
              child: Container(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 8,
                  top: 10,
                ),
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Classes".toUpperCase(),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${controller.counter['class']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SvgPicture.asset(
                            CLASS,
                            width: 70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: themeMode
                  ? Theme.of(context).primaryColor
                  : Color.fromARGB(255, 236, 248, 209),
              child: Container(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 8,
                  top: 10,
                ),
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Subjects".toUpperCase(),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${controller.counter['subjects']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SvgPicture.asset(
                            BOOKS,
                            width: 70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: themeMode
                  ? Theme.of(context).primaryColor
                  : Color.fromARGB(255, 248, 240, 228),
              child: Container(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 8,
                  top: 10,
                ),
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Users".toUpperCase(),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${controller.counter['users']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          child: SvgPicture.asset(
                            PROJECT,
                            width: 70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
