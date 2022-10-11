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
  static Future<Object> sendRequest(String url, Object body, context) async {
    print(body);
    final bodyParm = ({body});
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    try {
      var response = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: header);
      print(response);

      if (response.statusCode == 200) {
         Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const OnBoardingScreen(),
    ),
  );

        return Success(response: response.body);
      } else {
        return Failure(
            code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
      }
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
