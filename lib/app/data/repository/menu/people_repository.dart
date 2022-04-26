import 'dart:convert';

import 'package:grad/app/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class PeopleRepository {
  static var client = http.Client();

  static Future<List<dynamic>> getPeople({
    required school,
    required campus,
    required r,
    required type,
    required per_page,
    required page,
  }) async {
    var url =
        Uri.parse("$GRAD$PEOPLE/get/$school/$campus/$r/$type/$per_page/$page");
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (_) {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }

  static Future<Map<String, dynamic>> deleteUser({
    required school,
    required id,
    required type,
  }) async {
    var url = Uri.parse("$GRAD$PEOPLE/delete/$school/$id/$type");
    try {
      var response = await client.delete(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (_) {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }

  static Future<Map<String, dynamic>> createUser(data) async {
    var url = Uri.parse("$GRAD$PEOPLE/create");
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
        throw Exception('Failed to load data');
      }
    } catch (_) {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }

  static Future<List<dynamic>> getClassStudents({
    required school,
    required classId,
    required per_page,
    required page,
  }) async {
    var url = Uri.parse(
        "$GRAD$PEOPLE/class-students/student/$classId/$school/$per_page/$page");
    try {
      var response = await client.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return data['data'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (_) {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
