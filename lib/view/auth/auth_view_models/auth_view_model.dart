import 'dart:convert';
import 'dart:io';

import 'package:findate/constants/shared_preferences.dart';
import 'package:findate/constants/status_codes.dart';
import 'package:findate/models/userDataModel.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/services/web_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

class AuthViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  bool _loginError = false;
  bool get loginError => _loginError;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setLoginError(bool loginError) {
    _loginError = loginError;
  }

// login view model function
  loginUser(String url, body, context) async {
    setLoading(true);

    var response = await WebServices.sendPostRequest(url, body, context);

    if (response.code == SUCCESS) {

      final List result = response.body['data'];

      final decodedResponse = jsonDecode(response.body);

        //set save login user token
        UserPreferences.setLoginUerToken(decodedResponse['data']['token']);

      pushOnBoardingScreen(context);
      setLoading(false);

      return result.map(((e) => UserDataModel.fromJson(e))).toList();
    }
    if (response.code != SUCCESS) {
      setLoginError(true);
      setLoading(false);
    }
    setLoading(false);
  }
}
