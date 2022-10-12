import 'dart:io';

import 'package:findate/constants/status_codes.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/services/web_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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

// login view model

  loginUser(url, body, context) async {
    setLoading(true);

    Response response = await WebServices.sendRequest(url, body, context);


    if (response.statusCode == 200) {
      pushOnBoardingScreen(context);

      setLoading(false);
    }
    if (response.statusCode != 200) {
      setLoginError(true);
      setLoading(false);
    }
    setLoading(false);
  }
}
