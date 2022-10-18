import 'dart:convert';

import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/constants/shared_preferences.dart';
import 'package:findate/constants/status_codes.dart';
import 'package:findate/models/allUsersDataModel.dart';
import 'package:findate/models/userModel.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/services/web_service.dart';
import 'package:findate/view/profile_set_ups/profile_setup_screen.dart';
import 'package:findate/widgets/utils/snack_bar.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel();

//storing all user data rom api
  List<AllUsersModel> userData = [];
  List<UserModel> singleUserData = [];

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
  Future regisUser(String url, body, String email, context) async {
    setLoading(true);

    var response = await WebServices.sendPostRequest(url, body, context);

    if (response.code == 200) {
      //navigate to screen after successful registration
      pushConfrimEmailScreen(context, email);
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
  Future confrimEmail(String url, body, email, context) async {
    setLoading(true);

    var response =
        await WebServices.sendPatchRequest('$baseUrl/verify', body, context);

    if (response.code == SUCCESS) {
      //navigate to screen after email confirmation and registration

      pushProfileSetupAfterReg(context);
      // CustomWidgets.buildErrorSnackbar(
      //     context, 'Account Created successfully, please login to continue');
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

      userData = result.map(((e) => AllUsersModel.fromJson(e))).toList();

      notifyListeners();
    } else {
      throw Failure(
          code: UNKNOWN_ERROR, errorResponse: {'error': 'Unknown Error'});
    }
  }

  // resend otp for registration view model function
  Future resendOTP(String email, context) async {
    setLoading(true);

    var response = await WebServices.sendPostRequest(
        "$baseUrl/otp/resend", email, context);

    if (response.code == 200) {
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

  // Update users profile view model function
  Future updateProfile(body, context) async {
    setLoading(true);

    var response =
        await WebServices.sendPatchRequest('$baseUrl/update', body, context);

    if (response.response['statusCode'] == SUCCESS) {
      final result = response.response['data'];

      singleUserData.add(UserModel.fromJson(result));

      notifyListeners();

      pushOnBoardingScreen(context);

      setLoading(false);
    } else {
      setLoginError(true);
      setLoading(false);
    }

    setLoading(false);
  }
}
