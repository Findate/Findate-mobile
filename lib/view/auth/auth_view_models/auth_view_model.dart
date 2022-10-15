

import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/constants/shared_preferences.dart';
import 'package:findate/constants/status_codes.dart';
import 'package:findate/models/userDataModel.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/services/web_service.dart';
import 'package:findate/widgets/utils/snack_bar.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel();

//storing all user data rom api
  List<UserModel> userData = [];

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
      // //set save login user token from api response
      UserPreferences.setLoginUerToken(response.response['data']['token']);

      pushOnBoardingScreen(context);
      setLoading(false);

      //get all users onces login is succesful
      getAllUsers(context);
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

  // Register view model function
  Future regisUser(String url, body, context) async {
    setLoading(true);

    var response = await WebServices.sendPostRequest(url, body, context);

    if (response.code == 200) {
      //navigate to screen after successful registration
      pushConfrimEmailScreen(context);
      setLoading(false);
    } else {
      setLoginError(true);
      setLoading(false);
    }
    if (response.code != 200) {
      setLoginError(true);
      setLoading(false);
    }

    setLoading(false);
  }

  // Confrim email view model function
  Future confrimEmail(String url, body, context) async {
    setLoading(true);

    var response =
        await WebServices.sendPatchRequest('$baseUrl/verify', body, context);

    if (response.code == SUCCESS) {
      //navigate to screen after email confirmation and registration

      pushToLoginPage(context);
      CustomWidgets.buildErrorSnackbar(
          context, 'Account Created successfully, please login to continue');
      setLoading(false);
    } else {
      setLoginError(true);
      setLoading(false);
    }

    setLoading(false);
  }

  //Function that get all users data from API
  Future getAllUsers(context) async {
    var response = await WebServices.sendGetRequest(
      baseUrl,
      context,
    );

    if (response.response['statusCode'] == SUCCESS) {
      // final  result = jsonDecode(response.response);
      final List result = response.response['data']['users'];

      userData = result.map(((e) => UserModel.fromJson(e))).toList();

      notifyListeners();
    } else {
      throw Failure(
          code: UNKNOWN_ERROR, errorResponse: {'error': 'Unknown Error'});
    }
  }
}
