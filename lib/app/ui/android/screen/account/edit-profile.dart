import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:grad/app/controller/account/edit_profile_controller.dart';
import 'package:grad/app/core/constants/asset_path.dart';
import 'package:grad/app/core/functions/functions.dart';
import 'package:grad/app/ui/android/widgets/custom/cached_network_image.dart';

late TextEditingController firstNameController;
late TextEditingController lastNameController;
late TextEditingController middleNameController;
late TextEditingController phoneNumberController;
late TextEditingController addressController;
late TextEditingController cityController;
late TextEditingController countryController;
late String genderValue;

class EditProfle extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(builder: (controller) {
      if (controller.loading) return Container();
      return Scaffold(
        appBar: customAppBar("Edit Profile"),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
              bottom: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _avatar(),
                Text(
                  "User Information".toUpperCase(),
                ),
                Divider(),
                _firstName(),
                _lastName(),
                _middleName(),
                _phone(),
                _gender(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Contact Information".toUpperCase(),
                ),
                Divider(),
                _address(),
                _city(),
                _country(),
                Divider(),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(),
                    child: controller.processing
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
                      if (!controller.processing) {
                        Map<String, dynamic> _data = {
                          "first_name": firstNameController.text,
                          "last_name": lastNameController.text,
                          "middle_name": middleNameController.text,
                          "tel": phoneNumberController.text,
                          "gender": genderValue,
                          "address": addressController.text,
                          "city": cityController.text,
                          "country": countryController.text,
                        };
                        controller.setLoader();
                        await controller.updateProfile(data: _data);

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
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _avatar() {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            ClipOval(
              child: controller.picked
                  ? controller.imageFile == null
                      ? CustomNetworkImage(
                          url: "${controller.user['avatar']}",
                          ht: 80,
                          wd: 80,
                        )
                      : Image.file(
                          controller.imageFile!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )
                  : CustomNetworkImage(
                      url: "${controller.user['avatar']}",
                      ht: 80,
                      wd: 80,
                    ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: () async {
                  await controller.fetchImageFile();
                },
                child: SvgPicture.asset(
                  CAMERA,
                  width: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _country() {
    countryController =
        TextEditingController(text: "${controller.user['country']}");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: countryController,
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
          labelText: 'Country',
        ),
      ),
    );
  }

  Widget _city() {
    cityController = TextEditingController(text: "${controller.user['city']}");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: cityController,
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
          labelText: 'City',
        ),
      ),
    );
  }

  Widget _address() {
    addressController =
        TextEditingController(text: "${controller.user['address']}");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: addressController,
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
          labelText: 'Address',
        ),
      ),
    );
  }

  Widget _gender() {
    genderValue = controller.gender;
    return Container(
      margin: EdgeInsets.all(5),
      child: DropdownButton<String>(
        isExpanded: true,
        value: genderValue,
        onChanged: (String? value) {
          if (value != null) {
            controller.updateGenderState(value);
            genderValue = value;
          } else {
            genderValue = "";
          }
        },
        items: <String>['Select gender', 'male', 'female']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            child: Text(value),
            value: value,
          );
        }).toList(),
      ),
    );
  }

  Widget _phone() {
    phoneNumberController =
        TextEditingController(text: "${controller.user['tel']}");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: phoneNumberController,
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
          labelText: 'Phone Number',
        ),
      ),
    );
  }

  Widget _middleName() {
    middleNameController =
        TextEditingController(text: "${controller.user['middle_name']}");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: middleNameController,
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
          labelText: 'Middle Name',
        ),
      ),
    );
  }

  Widget _lastName() {
    lastNameController =
        TextEditingController(text: "${controller.user['last_name']}");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: lastNameController,
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
          labelText: 'Last Name',
        ),
      ),
    );
  }

  Widget _firstName() {
    firstNameController =
        TextEditingController(text: "${controller.user['first_name']}");
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: firstNameController,
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
          labelText: 'First Name',
        ),
      ),
    );
  }
}
