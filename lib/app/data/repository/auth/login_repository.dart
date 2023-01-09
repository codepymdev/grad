import 'dart:convert';

import 'package:grad/app/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  static var client = http.Client();

  static Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    print(data);
    var url = Uri.parse("${apiendpoint}auth/login");
    try {
      var response = await client.post(url, body: {
        "email": data['email'],
        "password": data['password'],
        "school": data['school']
      });
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return data;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (_) {
      return {"status": false, "message": "Oops, there was an error"};
    }
  }

  static Future<Map<String, dynamic>> recoveryCode(
      String email, String school) async {
    var url = Uri.parse("$apiendpoint$RECOVERY_CODE");
    try {
      var response =
          await client.post(url, body: {"email": email, "school": school});
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (_) {
      return {"status": false, "message": "Oops, there was an error"};
    }
  }

  static Future<Map<String, dynamic>> verifyAccount(
    String email,
    String school,
    String code,
  ) async {
    var url = Uri.parse("$apiendpoint$VERIFY_ACCOUNT");
    try {
      var response = await client.post(url, body: {
        "email": email,
        "school": school,
        "code": code,
      });
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (_) {
      return {"status": false, "message": "Oops, there was an error"};
    }
  }

  static Future<Map<String, dynamic>> changePassword({
    required password,
    required confirm_password,
    required email,
    required school,
  }) async {
    var url = Uri.parse("$apiendpoint$CHANGE_PASSWORD");
    try {
      var response = await client.post(url, body: {
        "email": email,
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
        throw Exception('Failed to load data');
      }
    } catch (_) {
      return {"status": false, "message": "Oops, there was an error"};
    }
  }

  static Future<Map<String, dynamic>?> updateAuthUser({
    required id,
    required school,
  }) async {
    var url = Uri.parse("$apiendpoint" + "auth/data/" + id + "/" + school);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status']) {
          return data['data'];
        }
        return null;
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }
}
