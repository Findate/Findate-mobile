import 'dart:io';

import 'package:findate/constants/status_codes.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/services/web_service.dart';
import 'package:flutter/material.dart';

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

    final response = await WebServices.sendRequest(url, body, context);

    if (response is Success) {
      pushOnBoardingScreen(context);

      loginUser(url, body, context) async {
        setLoading(true);

        final response = await WebServices.sendRequest(url, body, context);

        if (response is Success) {
          pushOnBoardingScreen(context);

          // pushToHomePage(context);

          setLoading(false);
        }
        if (response is Failure) {
          setLoginError(true);
          setLoading(false);
        }
        if (response is SocketException) {
          pushToNoInternetPage(context);
          setLoading(false);
        }
        setLoading(false);
      }
    }
  }
}
