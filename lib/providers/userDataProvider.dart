

import 'dart:convert';

import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/constants/status_codes%20copy.dart';
import 'package:findate/models/userDataModel.dart';
import 'package:findate/services/web_service.dart';
import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  List<UserModel> userData = [];

  UserDataProvider() {
    getAllUsers(baseUrl);
  }

  //Function that get all users data from API
  Future getAllUsers(url) async {

    var response = await WebServices.sendGetRequest(url);

    if (response.code == SUCCESS) {
      final List result = jsonDecode(response.response)['data']['users'];

      userData = result.map(((e) => UserModel.fromJson(e))).toList();

      notifyListeners();
    } else {
      throw Failure(
          code: UNKNOWN_ERROR, errorResponse: {'error': 'Unknown Error'});
    }
  }




  
}
