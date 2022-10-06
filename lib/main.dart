import 'package:findate/constants/appColor.dart';
import 'package:findate/view/auth/login_screen.dart';
import 'package:findate/view/landing_page/landing_page.dart';
import 'package:findate/view/on_bording/on_bording_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';




void main() {
  // add these lines
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // run app
  runApp(const  MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fin Date',
          theme: ThemeData(
            primaryColor: Colors.pink[50],
            primarySwatch: Colors.pink,
            unselectedWidgetColor: AppColor.mainColor
          ),
           home: const LandingPage()
     
        ); 
      },
      
    );
  }
}
