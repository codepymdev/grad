import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/settings/settings_controller.dart';
import 'package:grad/app/core/functions/functions.dart';

class SchoolConfiguration extends StatefulWidget {
  @override
  State<SchoolConfiguration> createState() => _SchoolConfigurationState();
}

class _SchoolConfigurationState extends State<SchoolConfiguration> {
  late TextEditingController schoolName;
  late TextEditingController schoolMoto;
  late TextEditingController schoolDetails;
  late TextEditingController schoolAddress;
  late TextEditingController schoolEmail1;
  late TextEditingController schoolEmail2;
  late TextEditingController schoolEmail3;
  late TextEditingController schoolTel1;
  late TextEditingController schoolTel2;
  late TextEditingController schoolTel3;
  late TextEditingController regNoPrefix;
  SettingsController settingsController = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(name: "School Configuration"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
            bottom: 15,
          ),
          child: Obx(
            () {
              if (settingsController.loading.value)
                return Center(
                  child: CircularProgressIndicator(),
                );
              List<dynamic> configs = settingsController.configs;

              return Column(children: [
                //school name
                _schoolName(
                  getConfigValue(configs, "school_name"),
                ),
                //school moto
                _schoolMoto(
                  getConfigValue(configs, "school_moto"),
                ),
                //School Details
                _schoolDetails(
                  getConfigValue(configs, "school_details"),
                ),
                //School Address
                _schoolAddress(
                  getConfigValue(configs, "school_address"),
                ),

                //School Email 1
                _schoolEmail1(
                  getConfigValue(configs, "school_email1"),
                ),
                //School Email 2
                _schoolEmail2(
                  getConfigValue(configs, "school_email2"),
                ),
                //School Email 3
                _schoolEmail3(
                  getConfigValue(configs, "school_email3"),
                ),
                //School Telephone 1
                _schoolTelephone1(
                  getConfigValue(configs, "school_tel1"),
                ),
                //School Telephone 2
                _schoolTelephone2(
                  getConfigValue(configs, "school_tel2"),
                ),
                //School Telephone 3
                _schoolTelephone3(
                  getConfigValue(configs, "school_tel3"),
                ),
                //Student ID Prefix
                _schoolStudentPrefix(
                  getConfigValue(configs, "reg_no_prefix"),
                ),

                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(),
                    child: settingsController.processing.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            "Save",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    onPressed: () async {
                      if (!settingsController.processing.value) {
                        await settingsController.updateSchoolConfig(data: {
                          "school_name": schoolName.text,
                          "school_moto": schoolMoto.text,
                          "school_details": schoolDetails.text,
                          "school_address": schoolAddress.text,
                          "school_email1": schoolEmail1.text,
                          "school_email2": schoolEmail2.text,
                          "school_email3": schoolEmail3.text,
                          "school_tel1": schoolTel1.text,
                          "school_tel2": schoolTel2.text,
                          "school_tel3": schoolTel3.text,
                          "reg_no_prefix": regNoPrefix.text,
                        });

                        if (settingsController.error.value) {
                          final snackBar = SnackBar(
                            content:
                                Text('${settingsController.error_msg.value}'),
                            backgroundColor: Colors.red,
                          );
                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        if (settingsController.success.value) {
                          final snackBar = SnackBar(
                            content:
                                Text('${settingsController.success_msg.value}'),
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
              ]);
            },
          ),
        ),
      ),
    );
  }

  Widget _schoolEmail2(val) {
    schoolEmail2 = TextEditingController(text: "$val");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: schoolEmail2,
        keyboardType: TextInputType.emailAddress,
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
          labelText: 'School Email 2',
        ),
      ),
    );
  }

  Widget _schoolEmail3(val) {
    schoolEmail3 = TextEditingController(text: "$val");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: schoolEmail3,
        keyboardType: TextInputType.emailAddress,
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
          labelText: 'School Email 3',
        ),
      ),
    );
  }

  Widget _schoolTelephone1(val) {
    schoolTel1 = TextEditingController(text: "$val");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: schoolTel1,
        keyboardType: TextInputType.phone,
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
          labelText: 'School Telephone 1',
        ),
      ),
    );
  }

  Widget _schoolTelephone2(val) {
    schoolTel2 = TextEditingController(text: "$val");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: schoolTel2,
        keyboardType: TextInputType.phone,
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
          labelText: 'School Telephone 2',
        ),
      ),
    );
  }

  Widget _schoolTelephone3(val) {
    schoolTel3 = TextEditingController(text: "$val");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: schoolTel3,
        keyboardType: TextInputType.phone,
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
          labelText: 'School Telephone 3',
        ),
      ),
    );
  }

  Widget _schoolStudentPrefix(val) {
    regNoPrefix = TextEditingController(text: "$val");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: regNoPrefix,
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
          labelText: 'Student ID Prefix',
        ),
      ),
    );
  }

  Widget _schoolEmail1(val) {
    schoolEmail1 = TextEditingController(text: "$val");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: schoolEmail1,
        keyboardType: TextInputType.emailAddress,
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
          labelText: 'School Email 1',
        ),
      ),
    );
  }

  Widget _schoolAddress(val) {
    schoolAddress = TextEditingController(text: "$val");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: schoolAddress,
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
          labelText: 'School Details',
        ),
      ),
    );
  }

  Widget _schoolDetails(val) {
    schoolDetails = TextEditingController(text: "$val");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: schoolDetails,
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
          labelText: 'School Details',
        ),
      ),
    );
  }

  Widget _schoolMoto(val) {
    schoolMoto = TextEditingController(text: "$val");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: schoolMoto,
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
          labelText: 'School Moto',
        ),
      ),
    );
  }

  Widget _schoolName(val) {
    schoolName = TextEditingController(text: "$val");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: schoolName,
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
          labelText: 'School Name',
        ),
      ),
    );
  }
}
