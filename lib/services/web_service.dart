// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:findate/constants/shared_preferences.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:dio/dio.dart';

import '../constants/status_codes copy.dart';

class WebServices {
  final dio = Dio();


//handles post requests
  static Future sendPostRequest(String url, Object body, context) async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    if (isConnected) {
      try {
        final response = await Dio().post(url,
            data: jsonEncode(body), options: Options(headers: header));

        if (response.statusCode == 200) {
          return Success(code: SUCCESS, response: response.data);
        }
      } on DioError catch (error) {
        // Handle error
        print(error.response!.data.toString());
        return Failure(
            code: error.response!.statusCode,
            errorResponse: {'error': error.response!.data.toString()});
      }
      //push to no internet screen if isConnected is false
    } else {
      pushToNoInternetPage(context);
      return Failure(
          code: NO_INTERNET, errorResponse: {'error': 'No Internet'});
    }
  }


//handles get requests
  static Future sendGetRequest(String url ) async {
    final token = UserPreferences.getToken();
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    if (isConnected) {
      try {
        final response = await Dio().get(url,options: Options(headers: header));

        if (response.statusCode == 200) {
          return Success(code: SUCCESS, response: response.data);
        }
      } on DioError catch (error) {

        // Handle error
        return Failure(
            code: error.response!.statusCode,
            errorResponse: {'error': error.response!.data.toString()});
      }
      //push to no internet screen if isConnected is false
    } else {
      // pushToNoInternetPage(context);
      return Failure(
          code: NO_INTERNET, errorResponse: {'error': 'No Internet'});
    }
  }
}

























//handles get requests
//   static Future sendGetRequest(String url) async {
//     final token = UserPreferences.getToken();
//     bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
//     final header = <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };

//     if (isConnected) {
//       final response = await http.get(Uri.parse(url), headers: header);

//       if (response.statusCode == SUCCESS) {
//         return Success(code: SUCCESS, response: response.body);
//         // return response;
//       }

//       Failure(code: INVALID_FORMAT, errorResponse: {'error': 'Invalid format'});
//     } else {
//       // pushToNoInternetPage(context);
//       return Failure(
//           code: NO_INTERNET,
//           errorResponse: {'error': 'No Internet Connection'});
//     }
//     return Failure(
//         code: UNKNOWN_ERROR, errorResponse: {'error': 'Unknown Error'});
//   }
// }


















  //hanles post requests
  // static Future sendPostRequest(String url, Object body, context) async {
  //   bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
  //   final header = <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   };

  //   if (isConnected) {
  //     final response = await http.post(Uri.parse(url),
  //         body: jsonEncode(body), headers: header);
  //     if (response.statusCode == 200) {
  //       return Success(code: SUCCESS, response: response.body);
  //     }
  //     return Failure(
  //         code: INVALID_FORMAT, errorResponse: {'error': 'Invalid format'});
  //   } else {
  //     pushToNoInternetPage(context);
  //     return Failure(
  //         code: NO_INTERNET, errorResponse: {'error': 'No Internet'});
  //   }
  // }