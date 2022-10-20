import 'package:findate/constants/appColor.dart';
import 'package:findate/view/auth/views/confirm_email.dart';
import 'package:findate/view/auth/views/login_screen.dart';
import 'package:findate/view/landing_page/landing_page.dart';
import 'package:findate/view/on_bording/on_bording_screen.dart';
import 'package:findate/view/profile_set_ups/profile_setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'constants/shared_preferences.dart';
import 'view/on_bording/matches/match_screen.dart';

void main() async {
  // add these lines
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();

  UserPreferences.resetSharedPref();
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
    bool expired = false;

    String? token = UserPreferences.getToken();

    if (token!.length > 5) {
      try {
        bool hasExpired = JwtDecoder.isExpired(token);
        setState(() {
          expired = hasExpired;
        });
      } catch (e) {
        expired = true;
      }
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
            home: MatchScreen(),
            // token.length < 5 || expired
            //     ? const LoginScreen()
            //     : const OnBoardingScreen(),
            routes: {LoginScreen.id: (context) => const LoginScreen()});
      },
    );
  }
}
