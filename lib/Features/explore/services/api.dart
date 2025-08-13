import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class CustomApi {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {
      'X-RapidAPI-Key': '1f08f77bb4mshcfa44821631db07p1e8de1jsna5e60201a260',
      'X-RapidAPI-Host': 'travel-advisor.p.rapidapi.com',
      'Accept': 'application/json; charset=utf-8',
    };
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      // For the sake of the Arabic language
      final bytes = response.bodyBytes;
      final utf8Text = utf8.decode(bytes, allowMalformed: true);
      return jsonDecode(utf8Text);
    } else {
      throw Exception(
        'there is a problem with status code${response.statusCode}',
      );
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'there is a problem with status code${response.statusCode} with body${response.body}',
      );
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'there is a problem with status code${response.statusCode} with body${response.body}',
      );
    }
  }
}
