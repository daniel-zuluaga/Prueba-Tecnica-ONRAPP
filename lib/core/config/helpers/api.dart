import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static final Map<String, String> _headers = {};

  /// Sets the default headers for HTTP requests.
  static Future<void> setHeaders() async {
    _headers[HttpHeaders.contentTypeHeader] = 'application/json';
  }

  /// Clears all headers previously set.
  static void clearHeaders() {
    _headers.clear();
  }

  /// Parses a JSON string into a Map.
  /// Returns: Map<String, dynamic>
  static dynamic decode(String response) => json.decode(response);

  /// Encodes a Map into a JSON string.
  /// Returns: String
  static String encode(Map<String, dynamic> response) => json.encode(response);

  /// Performs a GET request to the backend using the specified endpoint.
  /// Returns: Future with the result of the request.
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

  /// Performs a POST request to the backend using the specified endpoint and data.
  /// Returns: Future with the result of the request.
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

  /// Performs a PUT request to the backend using the specified endpoint and data.
  /// Returns: Future with the result of the request.
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
