import 'dart:convert';

import 'package:grad/app/core/constants/api_constants.dart';
import 'package:grad/app/data/model/class_model.dart';
import 'package:http/http.dart' as http;

class ResultRepository {
  static var client = http.Client();

  static Future<Map<String, dynamic>> currentResult({
    required data,
  }) async {
    var url = Uri.parse("$GRAD" + "results/currentResult");
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
      throw Exception('Failed to load data');
    }
  }

  static Future<List<ClasssModel>> getClasses({
    required school,
    required campus,
    required r,
  }) async {
    var url = Uri.parse("$GRAD" + "results/getClasses/$school/$campus/$r");
    try {
      var response = await client.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return data.map((dynamic item) => ClasssModel.fromJson(item)).toList();
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (_) {
      throw Exception("Failed to load data");
    }
  }
}
