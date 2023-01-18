import 'dart:convert';

import 'package:grad/app/core/constants/api_constants.dart';
import 'package:grad/app/data/model/arm_model.dart';
import 'package:grad/app/data/model/campus_model.dart';
import 'package:grad/app/data/model/role_model.dart';
import 'package:http/http.dart' as http;

class SettingsRepository {
  static var client = http.Client();

  static Future<Map<String, dynamic>> recoveryCode(
      String email, String school) async {
    var url = Uri.parse("${apiendpoint}auth/forgot-password");
    try {
      var response =
          await client.post(url, body: {"email": email, "school": school});
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return {};
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
    var url = Uri.parse("${apiendpoint}auth/verify-account");
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
        return {};
      }
    } catch (_) {
      return {"status": false, "message": "Oops, there was an error"};
    }
  }

  static Future<List<dynamic>> getConfigSettings({
    required school,
  }) async {
    var url = Uri.parse("${apiendpoint}settings/$school");
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        return [];
      }
    } catch (_) {
      return [];
    }
  }

  static Future<Map<String, dynamic>> updateSchoolConfig({
    required data,
  }) async {
    var url = Uri.parse("${apiendpoint}settings/school-configuration");
    try {
      var response = await client.post(
        url,
        body: data,
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return {};
      }
    } catch (_) {
      print(_.toString());
      return {};
    }
  }

  static Future<Map<String, dynamic>> updateSession({
    required data,
  }) async {
    var url = Uri.parse("${apiendpoint}settings/session");
    try {
      var response = await client.post(
        url,
        body: data,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        return {};
      }
    } catch (_) {
      return {};
    }
  }

  static Future<Map<String, dynamic>> updateTerm({
    required data,
  }) async {
    var url = Uri.parse("${apiendpoint}settings/term");
    try {
      var response = await client.post(
        url,
        body: data,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return {};
      }
    } catch (_) {
      return {};
    }
  }

  static Future<Map<String, dynamic>> updateStamp(
      Map<String, dynamic> data) async {
    var url = Uri.parse("${apiendpoint}settings/stamp");
    try {
      var request = await http.MultipartRequest(
        "POST",
        url,
      );
      if (data['image'] != "")
        request.files.add(
          await http.MultipartFile.fromPath("image", data['image']),
        );
      request.fields['school'] = data['school'];

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

  static Future<Map<String, dynamic>> submitBugIssue({
    required data,
  }) async {
    var url = Uri.parse("${apiendpoint}settings/bug");
    try {
      var response = await client.post(
        url,
        body: data,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        return {};
      }
    } catch (_) {
      return {};
    }
  }

  static Future<List<Campus>> getCampus({
    required school,
  }) async {
    var url = Uri.parse("${apiendpoint}settings/campus/$school");

    try {
      var response = await client.get(url);

      if (response.statusCode == 200) {
        List data = json.decode(response.body) as List;

        List<Campus> campuses =
            data.map((dynamic item) => Campus.fromJson(item)).toList();

        return campuses;
      } else {
        return [];
      }
    } catch (_) {
      return [];
    }
  }

  static Future<List<Arm>> getArms({
    required school,
  }) async {
    var url = Uri.parse("${apiendpoint}settings/arms/$school");

    try {
      var response = await client.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        var arms = data.map((dynamic item) => Arm.fromJson(item)).toList();
        return arms;
      } else {
        return [];
      }
    } catch (_) {
      return [];
    }
  }

  static Future<List<Role>> getRoles({
    required school,
    required type,
  }) async {
    var url = Uri.parse("${apiendpoint}settings/roles/$school/$type");
    try {
      var response = await client.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return data.map((dynamic item) => Role.fromJson(item)).toList();
      } else {
        return [];
      }
    } catch (_) {
      return [];
    }
  }
}
