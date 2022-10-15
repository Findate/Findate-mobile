
import 'package:findate/models/userDataModel.dart';
import 'package:findate/view/auth/auth_view_models/auth_view_model.dart';
import 'package:flutter/material.dart';




class UserDataProvider extends ChangeNotifier {
  List<UserModel> userData = [];

  UserDataProvider() {
    getUsers();
  }

  Future getUsers() async {
    userData = await AuthViewModel().getAllUsers();
    notifyListeners();
  }










  //Function that get all users data from API
  // Future getAllUsers(url) async {

  //   var response = await WebServices.sendGetRequest(url);

  //   if (response.code == SUCCESS) {
  //     final List result = jsonDecode(response.response)['data']['users'];

  //     userData = result.map(((e) => UserModel.fromJson(e))).toList();

  //     notifyListeners();
  //   } else {
  //     throw Failure(
  //         code: UNKNOWN_ERROR, errorResponse: {'error': 'Unknown Error'});
  //   }
  // }

}
