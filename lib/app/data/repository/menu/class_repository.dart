import 'dart:convert';

import 'package:grad/app/core/constants/api_constants.dart';
import 'package:grad/app/data/model/class_categories_model.dart';
import 'package:http/http.dart' as http;

class ClassRepository {
  static var client = http.Client();

  static Future<List<dynamic>> getClasses({
    required school,
    required campus,
    required r,
    required per_page,
    required page,
  }) async {
    var url = Uri.parse(
        "$apiendpoint" + "classes/get/$school/$campus/$r/$per_page/$page");
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        return jsonResponse["data"];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<Map<String, dynamic>> deleteClass({
    required school,
    required id,
  }) async {
    var url = Uri.parse("$apiendpoint" + "classes/delete/$school/$id");
    try {
      var response = await client.delete(url);
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

  static Future<List<ClassCategoriesModel>> classCategories(
      {required school}) async {
    var url = Uri.parse("$apiendpoint" + "classes/class-categories/$school");
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return data
            .map((dynamic item) => ClassCategoriesModel.fromJson(item))
            .toList();
      } else {
        return [];
      }
    } catch (_) {
      return [];
    }
  }

  static Future<Map<String, dynamic>> addClass({required data}) async {
    var url = Uri.parse("$apiendpoint" + "classes/create");
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
}
