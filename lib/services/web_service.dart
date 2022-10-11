import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_connection_checker/simple_connection_checker.dart';

import '../constants/status_codes copy.dart';

class WebServices {
  static Future<Object> sendRequest(String url, Object body, context) async {
    print(body);

    try {
      var response = await http.post(Uri.parse('findate.herokuapp.com/api/v1/users/login'), body:{
                                "username": "kolikay1989@gmail.com",
                                "password": "password",
                              } );

      print(response.body);

      if (response.statusCode == 200) {
        print('passed');
    
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
