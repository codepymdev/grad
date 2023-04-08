import 'dart:convert';

import 'package:Grad/app/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class AttendanceRepository {
  static var client = http.Client();

  static Future<List<dynamic>> attendance({
    required classId,
    required school,
    required year,
    required term,
  }) async {
    var url = Uri.parse("$grad" + "attendance/get");
    try {
      var response = await client.post(url, body: {
        "classId": classId,
        "school": school,
        "year": year,
        "term": term
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

  static Future<List<dynamic>> getAtt({
    required classId,
    required school,
    required year,
    required term,
    required date,
  }) async {
    var url = Uri.parse("$grad" + "attendance/getAttendance");
    try {
      var response = await client.post(url, body: {
        "classId": classId,
        "school": school,
        "year": year,
        "term": term,
        "date": date,
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
    var url = Uri.parse("$grad" + "attendance/create");

    try {
      var response = await client.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "classId": data["classId"],
          "school": data["school"],
          "year": data['year'],
          "term": data['term'],
          "date": data['date'],
          "attendance": data['attendance'],
        }),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
        return data;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (_) {
      print(_.toString());
      throw Exception('Failed to load data');
    }
  }

  static Future<Map<String, dynamic>> delete({
    required school,
    required id,
  }) async {
    var url = Uri.parse("$grad" + "attendance/delete/$school/$id");
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
