import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iapp_flutter/models/api.dart';
import 'package:iapp_flutter/widgets/constants.dart';

class ApiServices {
  static Future<List<ApiModel>> getApi() async {
    try {
      final response = await http.get(Uri.parse('${Constants.api}/posts'));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        List<ApiModel> apiList = jsonResponse.map((data) => ApiModel.fromJson(data)).toList();
        return apiList;
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error fetching data from API');
    }
  }
}
