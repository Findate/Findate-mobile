import 'package:findate/constants/appColor.dart';
import 'package:findate/view/auth/auth_view_models/auth_view_model.dart';
import 'package:findate/view/auth/views/login_screen.dart';
import 'package:findate/view/on_bording/on_bording_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'constants/shared_preferences.dart';


void main() async {
  // add these lines
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();

  // UserPreferences.resetSharedPref();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // run app
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final auth = AuthViewModel.instance;

    final username = UserPreferences.getUsername();
  

    auth.getLoginUserData({
      "username": username,
    }, context);

    auth.getAllUsers(context);

    bool expired = true;

    String token = UserPreferences.getToken() ?? '';

    if (token.length > 5) {
      bool hasExpired = JwtDecoder.isExpired(token);
      setState(() {
        expired = hasExpired;
      });
    }

    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fin Date',
            theme: ThemeData(
                primaryColor: Colors.pink[50],
                primarySwatch: Colors.pink,
                unselectedWidgetColor: AppColor.mainColor),
            home: expired ? const LoginScreen() : const OnBoardingScreen(),
            routes: {LoginScreen.id: (context) => const LoginScreen()});
      },
    );
  }
}
