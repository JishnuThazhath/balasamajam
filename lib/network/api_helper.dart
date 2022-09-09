import 'dart:convert';

import 'package:balasamajam/network/api_enums.dart';
import 'package:balasamajam/network/api_typedef.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  const APIHelper._();

  static String addQueryParams(String url, Map<String, String>? queryParams) {
    if (url.isEmpty) return url;
    if (queryParams == null || queryParams.isEmpty) return url;

    final StringBuffer stringBuffer = StringBuffer("$url?");
    queryParams.forEach((key, value) {
      if (value.contains(' ') || value.isEmpty) {
        throw Exception("Bad Query Parameter");
      }

      if (value.trim() == '') return;

      stringBuffer.write(value);
    });

    final result = stringBuffer.toString();
    return result.substring(0, result.length - 1);
  }

  static R filterResponse<R>(
      {required APICallback apiCallback,
      required http.Response? response,
      required APIOnFailureCallBackWithMessage
          apiOnFailureCallBackWithMessage}) {
    try {
      if (response == null || response.body.isEmpty) {
        return apiOnFailureCallBackWithMessage(
            APIResponseErrorType.EMPTY_RESPONSE, "Contact your Administrator");
      }

      Map<String, dynamic> json = jsonDecode(response.body);
      print("got result : $json");

      if (!_isValidResponse(json)) {
        return apiOnFailureCallBackWithMessage(
            APIResponseErrorType.EMPTY_RESPONSE,
            "Reponse is empty. Contact your Administrator");
      }

      if ((response.statusCode == 200 || response.statusCode == 201) &&
          json['status'] == "OK") {
        return apiCallback(json);
      } else {
        return apiOnFailureCallBackWithMessage(
            // here if the respose contains any error message you can get that and put it here. that makes more sense right ?
            APIResponseErrorType.FAILED,
            json['message']);
      }
    } catch (e, stacktrace) {
      debugPrint("Error - $e :::: $stacktrace");
      return apiOnFailureCallBackWithMessage(APIResponseErrorType.UNKNOWN,
          "Something went wrong. Contact your Administrator!");
    }
  }

  static bool _isValidResponse(json) {
    return json != null;
  }
}
