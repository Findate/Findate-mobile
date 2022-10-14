import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/models/userDataModel.dart';
import 'package:findate/view/auth/auth_view_models/auth_view_model.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  List<UserModel> userData = [];

  DataProvider() {
    getuserData();
  }

  Future<void> getuserData() async {
    final userList = await AuthViewModel().getUsers(baseUrl);

    userData = userList;

    notifyListeners();
  }
}
