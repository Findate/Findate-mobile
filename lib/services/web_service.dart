// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:findate/routes/page_routes.dart';
import 'package:findate/view/on_bording/on_bording_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_connection_checker/simple_connection_checker.dart';

import '../constants/status_codes copy.dart';

class WebServices {
  static Future sendRequest(String url, Object body, context) async {
    print(body);

    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    try {
      var response = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: header);
      return response;
    } catch (e) {
      return e.toString();
    }
  }
}
