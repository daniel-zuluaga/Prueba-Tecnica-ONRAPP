import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static final Map<String, String> _headers = {};

  static Future<void> setHeaders() async {
    _headers[HttpHeaders.contentTypeHeader] = 'application/json';
  }

  static void clearHeaders() {
    _headers.clear();
  }

  // Parsea un json en formato string a un Map
  // Returns. Map String, dynamic
  static dynamic decode(String response) => json.decode(response);

  // Encode un json en formato Map a un String
  // Returns. Map String, dynamic
  static String encode(Map<String, dynamic> response) => json.encode(response);

  //Realiza peticiones tipo GET al backend al endpoint pasado por parámetro
  //Returns Future con el resultado de la consulta
  static Future<dynamic> get(String path) async {
    await setHeaders();
    debugPrint('-------------GETHEADER--------------');
    debugPrint('headers---------: $_headers');
    Uri uri = Uri.parse(path);
    final response = await http.get(
      uri,
      headers: _headers,
    );
    return response;
  }
  //Realiza peticiones tipo POST al backend al endpoint pasado por parámetro
  //Returns Future con el resultado de la consulta
  static Future<dynamic> post(String path, Map<String, dynamic> data) async {
    await setHeaders();
    debugPrint('---------------------------');
    debugPrint('headers---------: $_headers');
    final body = encode(data);
    Uri uri = Uri.parse(path);
    try {
      final response = await http.post(
        uri,
        body: body,
        headers: _headers,
      );
      debugPrint("response: ${response.headers}");
      return response;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  // static Future<dynamic> postFormData(String path,Map<String, dynamic> data)async {
  //   await setHeaders();

  // }

  static Future<dynamic> put(String path, Map<String, dynamic> data) async {
    await setHeaders();
    debugPrint('---------------------------');
    debugPrint('headers---------: $_headers');
    final body = encode(data);
    Uri uri = Uri.parse(path);
    try {
      final response = await http.put(
        uri,
        body: body,
        headers: _headers,
      );
      debugPrint("response: ${response.headers}");
      return response;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}