// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:findate/constants/shared_preferences.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:http/http.dart' as http;
import 'package:simple_connection_checker/simple_connection_checker.dart';

import '../constants/status_codes copy.dart';

class WebServices {
  //hanles post requests
  static Future sendPostRequest(String url, Object body, context) async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    if (isConnected) {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: header);
      if (response.statusCode == 200) {
        return Success(code: SUCCESS, response: response.body);
      }
      Failure(code: INVALID_FORMAT, errorResponse: {'error': 'Invalid format'});
    } else {
      pushToNoInternetPage(context);
      return Failure(
          code: NO_INTERNET,
          errorResponse: {'error': 'No Internet Connection'});
    }
    return Failure(
        code: UNKNOWN_ERROR, errorResponse: {'error': 'Unknown Error'});
  }




  

//handles get requests
  static Future sendGetRequest(String url) async {

    final token = UserPreferences.getToken();
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    if (isConnected) {
      final response = await http.get(Uri.parse(url), headers: header);

      if (response.statusCode == SUCCESS) {
        return Success(code: SUCCESS, response: response.body);
        // return response;
      }
      Failure(code: INVALID_FORMAT, errorResponse: {'error': 'Invalid format'});
    } else {
      // pushToNoInternetPage(context);
      return Failure(
          code: NO_INTERNET,
          errorResponse: {'error': 'No Internet Connection'});
    }
    return Failure(
        code: UNKNOWN_ERROR, errorResponse: {'error': 'Unknown Error'});
  }
}
