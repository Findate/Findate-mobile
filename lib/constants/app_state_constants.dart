// ignore_for_file: non_constant_identifier_names





import 'package:findate/view/auth/auth_view_models/auth_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


const String baseUrl = 'https://findate.herokuapp.com/api/v1/users/';



final authViewModelProvider = ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel();
});


// final userDataProvider = ChangeNotifierProvider<UserDataProvider>((ref){
//   return UserDataProvider();
// });



