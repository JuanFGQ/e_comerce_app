import 'dart:convert';

import 'package:http/http.dart' as http;

class THttpHelper {
  static const String _baseUrl = '';

  //HELPER TO MAKE GET REQUEST

  static Future<Map<String, dynamic>> get(String endPoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endPoint'));

    return _handleResponse(response);
  }

  //HELPER METHOD TO AKE POST REQUEST

  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final response = await http.post(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-type': 'application/json'}, body: json.encode(data));

    return _handleResponse(response);
  }

//HELPER METHOD TO MAKE PUT REQUEST
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-type': 'application/json'}, body: json.encode(data));
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));

    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}