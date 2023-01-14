import 'dart:convert';

import 'package:grad/app/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class ProfileRepository {
  static var client = http.Client();

  static Future<Map<String, dynamic>> updateProfile(
      Map<String, dynamic> data) async {
    var url = Uri.parse("${apiendpoint}account/update-profile");
    try {
      var request = await http.MultipartRequest(
        "POST",
        url,
      );
      if (data['image'] != "")
        request.files.add(
          await http.MultipartFile.fromPath("image", data['image']),
        );
      request.fields['id'] = data['id'];
      request.fields['school'] = data['school'];
      request.fields['first_name'] = data['first_name'];
      request.fields['last_name'] = data['last_name'];
      request.fields['middle_name'] = data['middle_name'];
      request.fields['gender'] = data['gender'];
      request.fields['tel'] = data['tel'];
      request.fields['address'] = data['address'];
      request.fields['city'] = data['city'];
      request.fields['country'] = data['country'];

      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data;
      } else {
        return {
          "status": false,
          "validate": false,
          "message": "Oops, there was an error"
        };
      }
    } catch (_) {
      return {
        "status": false,
        "validate": false,
        "message": "Oops, there was an error",
        "error": _.toString(),
      };
    }
  }

  static Future<Map<String, dynamic>> changePassword({
    required password,
    required confirm_password,
    required userid,
    required school,
  }) async {
    var url = Uri.parse("${apiendpoint}account/change-password-account");
    try {
      var response = await client.post(url, body: {
        "userid": userid,
        "school": school,
        "password": password,
        "confirm_password": confirm_password,
      });
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return {"status": false, "message": "Oops, there was an error"};
      }
    } catch (_) {
      return {"status": false, "message": "Oops, there was an error"};
    }
  }

  static Future<List<dynamic>> getRecentActivities({
    required school,
    required userid,
    required per_page,
    required page,
  }) async {
    var url = Uri.parse(
        "${apiendpoint}account/recent-activities/$school/$userid/$per_page/$page");

    try {
      var respone = await client.get(url);

      if (respone.statusCode == 200) {
        final data = json.decode(respone.body);
        return data['data'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return [];
      }
    } catch (_) {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return [];
    }
  }
}
