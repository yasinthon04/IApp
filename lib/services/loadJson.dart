import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:iapp_flutter/models/people.dart';

class Database {
  static Future<List<PeopleModel>> getPeople() async {
    try {
      final List<PeopleModel> peopleData = await loadJsonData();
      return peopleData;
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load data: $e');
    }
  }

  static Future<List<PeopleModel>> loadJsonData() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/peopleData.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map<PeopleModel>((json) => PeopleModel.fromJson(json)).toList();
  }
}
