// ignore_for_file: non_constant_identifier_names


import 'package:findate/view/auth/auth_view_models/auth_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


const String baseUrl = 'findate.herokuapp.com/api/v1/users/login';



final authViewModelProvider = ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel();
});



// final profileViewModelProvider =
//     ChangeNotifierProvider<ProfileModelView>((ref) {
//   return ProfileModelView();
// });




// // Update state and notify Notification screen app bar
// final notificationProvider = ChangeNotifierProvider<NotificationViewModel>((ref) {
//   return NotificationViewModel();
// });


