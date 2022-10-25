// ignore_for_file: non_constant_identifier_names





import 'package:findate/models/userModel.dart';
import 'package:findate/view/auth/auth_view_models/auth_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


const String baseUrl = 'https://findate.herokuapp.com/api/v1/users/';


//provider for auth functions
final authViewModelProvider = ChangeNotifierProvider.autoDispose<AuthViewModel>((ref) {
  return AuthViewModel.instance;
});


//provider for user api data
final provider = Provider<UserModel>((ref) {
  return AuthViewModel.instance.userApiData;
});





