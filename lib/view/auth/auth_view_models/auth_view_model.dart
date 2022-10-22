import 'dart:convert';
import 'dart:io';

import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/constants/shared_preferences.dart';
import 'package:findate/constants/status_codes.dart';
import 'package:findate/models/allUsersDataModel.dart';
import 'package:findate/models/userModel.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/services/web_service.dart';
import 'package:findate/view/auth/views/confirm_email.dart';
import 'package:findate/view/profile_set_ups/profile_setup_screen.dart';
import 'package:findate/view/profile_set_ups/purpose_for_signup_screen.dart';
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

      //get Loged in user details
      getLoginUserData({
        "username": body["username"],
      }, context);

      //navigate to onbording screen
      pushOnBoardingScreen(context);

      setLoading(false);
    } else {
      setLoginError(true);
      setLoading(false);
    }
    if (response.code != 200 || response.code != 201) {
      setLoginError(true);
      setLoading(false);
    }
    setLoading(false);
  }

  // login after user first registration
  Future loginUserAfterReg(String url, body, context) async {
    setLoading(true);

    var response = await WebServices.sendPostRequest(url, body, context);

    if (response.code == SUCCESS) {
      // //set save login user token from api response
      await UserPreferences.setLoginUerToken(
          response.response['data']['token']);

      //navigate
      pushProfileSetupAfterReg(context);

      setLoading(false);
    } else {
      setLoginError(true);
      setLoading(false);
    }
    if (response.code != 200 || response.code != 201) {
      setLoginError(true);
      setLoading(false);
    }
    setLoading(false);
  }

  // Register view model function
  Future regisUser(String url, body, String email, context) async {
    setLoading(true);

    var response = await WebServices.sendPostRequest(url, body, context);

    if (response.code == 201 || response.code == 200) {
      //navigate to screen after successful registration
      pushConfrimEmailScreen(context, email);

      setLoading(false);
    } else {
      setLoginError(true);
      setLoading(false);
    }
    if (response.code != 200 || response.code != 201) {
      setLoginError(true);
      setLoading(false);
    }

    setLoading(false);
  }

  // Confrim email view model function
  Future confrimEmail(body, email, context) async {
    setLoading(true);

    var response =
        await WebServices.sendPatchRequest('$baseUrl/verify', body, context);

    if (response.code == SUCCESS) {
      //navigate to screen after email confirmation and registration
      pushLoginAfterRegSetup(context);

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

      // userData = result.map(((e) => AllUsersModel.fromJson(e))).toList();
      userData = result.map(((e) => UserModel.fromJson(e))).toList();

      notifyListeners();
    } else {
      throw Failure(
          code: UNKNOWN_ERROR, errorResponse: {'error': 'Unknown Error'});
    }
  }

  // resend otp for registration view model function
  Future resendOTP(email, context) async {
    setLoading(true);

    var response = await WebServices.sendPostRequest(
        "$baseUrl/otp/resend", email, context);

    if (response.code == 201 || response.code == 200) {
      setLoading(false);
    } else {
      setLoginError(true);
      setLoading(false);
    }
    if (response.code != 200 || response.code != 201) {
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

      userData.add(UserModel.fromJson(result));

      pushOnBoardingScreen(context);

      notifyListeners();

      setLoading(false);
    } else {
      setLoginError(true);
      setLoading(false);
    }

    setLoading(false);
  }

//Update profile Picture
  Future updateProfilePix(File? image, context) async {
    setLoading(true);

    var response = await WebServices.uploadImageToApi(
        '$baseUrl/profile-picture', image, context);

    if (response.response['statusCode'] == 200 ||
        response.response['statusCode'] == 201) {
      final res = response.response['data'];

      UserPreferences.setUserProfilePix(res['photo']);

      print(res['photo']);

      userData.add(UserModel.fromJson(res));

      notifyListeners();

      setLoading(false);
    } else {
      setLoginError(true);
      setLoading(false);
    }

    setLoading(false);
    return response;
  }

  // Update users profile view model function
  Future getLoginUserData(body, context) async {
    setLoading(true);

    var response = await WebServices.sendPostRequest(baseUrl, body, context);

    if (response.response['statusCode'] == SUCCESS) {
      final result = response.response['data'];

      userData.add(UserModel.fromJson(result));

      notifyListeners();

      setLoading(false);
    } else {
      setLoginError(true);
      setLoading(false);
    }

    setLoading(false);
  }

  // reset password fuction
  Future recoverAccount(Object body, String email, context) async {
    setLoading(true);

    var response = await WebServices.sendPatchRequest(
        '$baseUrl/recover-account', body, context);

    if (response.response['statusCode'] == SUCCESS) {
      print(response.response['message']);
      pushRecoverAccountConfrimEmailScreen(context, email);

      setLoading(false);
    } else {
      setLoginError(true);
      setLoading(false);
    }

    setLoading(false);
  }

  // reset password fuction
  Future resetPassword(body, email, context) async {
    setLoading(true);

    var response = await WebServices.sendPatchRequest(
        '$baseUrl/reset-password', body, context);

    if (response.response['statusCode'] == SUCCESS) {
      pushToLoginPage(context);

      setLoading(false);
    } else {
      setLoginError(true);
      setLoading(false);
    }

    setLoading(false);
  }
}
