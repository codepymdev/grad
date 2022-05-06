import 'dart:convert';

import 'package:grad/app/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class AttendanceRepository {
  static var client = http.Client();

  static Future<List<dynamic>> attendance({
    required classId,
    required school,
    required studentId,
    required year,
    required team,
  }) async {
    var url = Uri.parse("$GRAD" + "attendance/get");
    try {
      var response = await client.post(url, body: {
        "classId": classId,
        "school": school,
        "studentId": studentId,
        "year": year,
        "team": team
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
      throw Exception('Failed to load data');
    }
  }

  static Future<Map<String, dynamic>> create({required data}) async {
    var url = Uri.parse("$GRAD" + "attendance/create");
    try {
      var response = await client.post(url, body: data);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (_) {
      throw Exception('Failed to load data');
    }
  }

  static Future<Map<String, dynamic>> delete({
    required school,
    required id,
  }) async {
    var url = Uri.parse("$GRAD" + "attendance/delete/$school/$id");
    try {
      var response = await client.delete(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (_) {
      throw Exception('Failed to load data');
    }
  }
}
