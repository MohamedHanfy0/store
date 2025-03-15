import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw Exception(
        "there is a problem with status code ${response.statusCode}",
      );
    }
  }

  Map<String, String> headers = {
    'Content-Type': 'multipart/form-data',
    'Accept': 'application/json',
  };

  Future<dynamic> post({
    required String url,
    @required Map? body,
    @required String? token,
  }) async {
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.body == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return body;
    } else {
      throw Exception('there is a problem with status code ${response.statusCode} with body ${response.body}');
    }
  }
}
