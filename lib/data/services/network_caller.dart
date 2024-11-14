import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:taskmanager_withgetx/data/models/network_response.dart';
import 'package:taskmanager_withgetx/data/utlis/debug_print.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint(url);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      final Response response = await get(
        uri,
        headers: headers,
      );

      responsePrint(url, response.statusCode, response.body);

      final decodeData = jsonDecode(response.body);

      if (response.statusCode == 200 && decodeData['status'] == 'success') {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseBody: decodeData,
        );
      } else if (response.statusCode == 401 ||
          response.statusCode == 404 && decodeData['status'] == 'fail') {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMassage: decodeData['data'],
        );
      } else {
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: false,
            errorMassage: 'please try again');
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMassage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);

      debugPrint(url);

      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      final Response response = await post(
        uri,
        body: jsonEncode(body),
      );
      responsePrint(url, response.statusCode, response.body);
      requestCheck(url, headers, body!);

      final encodeData = jsonDecode(response.body);
      if (response.statusCode == 200 && encodeData['status'] == 'success') {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseBody: response.body,
        );
      } else if (response.statusCode == 401 ||
          response.statusCode == 404 && encodeData['status'] == 'fail') {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMassage: encodeData['data'],
        );
      } else {
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: false,
            errorMassage: 'please try again');
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMassage: e.toString(),
      );
    }
  }
}
