import 'dart:convert';

import 'package:findate/constants/shared_preferences.dart';
import 'package:findate/constants/status_codes.dart';
import 'package:findate/models/userData.dart';
import 'package:findate/models/userDataModel.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/services/web_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel();
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
  Future loginUser(String url, body, context) async {
    setLoading(true);

    var response = await WebServices.sendPostRequest(url, body, context);

    if (response.code == SUCCESS) {
      final result = jsonDecode(response.response)['data'];

      //set save login user token
      UserPreferences.setLoginUerToken(result['token']);

      pushOnBoardingScreen(context);
      setLoading(false);
    } else {
      setLoginError(true);
      setLoading(false);
    }
    if (response.code != SUCCESS) {
      setLoginError(true);
      setLoading(false);
    }
    setLoading(false);
  }

//get all users function
  Future<List<UserModel>> getUsers(url) async {

    var response = await WebServices.sendGetRequest(url);

    if (response.code == SUCCESS) {
      final List result = jsonDecode(response.response)['data']['users'];

      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Failure(
          code: UNKNOWN_ERROR, errorResponse: {'error': 'Unknown Error'});
    }
  }
}

final userProvider = Provider<AuthViewModel>((ref) => AuthViewModel());
