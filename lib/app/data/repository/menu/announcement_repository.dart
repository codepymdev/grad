import 'dart:convert';

import 'package:grad/app/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class AnnouncementRepository {
  static var client = http.Client();

  static Future<List<dynamic>> announcements({
    required school,
    required per_page,
    required page,
  }) async {
    var url =
        Uri.parse("$apiendpoint" + "announcement/get/$school/$per_page/$page");
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
      throw Exception('Failed to load data');
    }
  }

  static Future<Map<String, dynamic>> getCurrentAnnouncement({
    required school,
  }) async {
    var url = Uri.parse("$apiendpoint" + "announcement/current/$school");
    try {
      var response = await client.get(url);
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

  static Future<Map<String, dynamic>> createAnnouncement({
    required data,
  }) async {
    var url = Uri.parse("$apiendpoint" + "announcement/upload");
    try {
      var response = await client.post(
        url,
        body: data,
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        print(response.statusCode);
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (_) {
      throw Exception('Failed to load data');
    }
  }

  static Future<Map<String, dynamic>> editAnnouncement({
    required data,
  }) async {
    var url = Uri.parse("$apiendpoint" + "announcement/update");
    try {
      var response = await client.post(
        url,
        body: data,
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      } else {
        print(response.statusCode);
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
    var url = Uri.parse("$apiendpoint" + "announcement/delete/$school/$id");
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
      throw Exception('Failed to load data');
    }
  }

  static Future<Map<String, dynamic>> pin({
    required data,
  }) async {
    var url = Uri.parse("$apiendpoint" + "announcement/pin");
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

  static Future<Map<String, dynamic>> unpin({
    required data,
  }) async {
    var url = Uri.parse("$apiendpoint" + "announcement/unpin");
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
}
