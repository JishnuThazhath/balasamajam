import 'dart:convert';

import 'package:balasamajam/network/api_enums.dart';
import 'package:balasamajam/network/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIService {
  const APIService._();

  static Map<String, String> _getHeaders() =>
      {"Content-Type": "application/json"};

  static Future<http.Response>? _createRequest(
      {required RequestType requestType,
      required Uri uri,
      Map<String, String>? headers,
      Map<String, dynamic>? body}) {
    if (requestType == RequestType.GET) {
      return http.get(uri, headers: headers);
    } else if (requestType == RequestType.POST) {
      return http.post(uri, body: jsonEncode(body), headers: headers);
    }

    return null;
  }

  static Future<http.Response?>? sendRequest({
    required RequestType requestType,
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? queryParams,
  }) async {
    try {
      final _headers = _getHeaders();

      final _url = APIHelper.addQueryParams(url, queryParams);

      print(body);

      final response = await _createRequest(
          requestType: requestType,
          uri: Uri.parse(_url),
          headers: _headers,
          body: body);

      return response;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }
}
