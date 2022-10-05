import 'package:findate/constants/appColor.dart';
import 'package:findate/view/on_bording/explore/explore_screen.dart';
import 'package:findate/view/on_bording/on_bording_screen.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileSetupCompleteScreen extends StatelessWidget {
  const ProfileSetupCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Container(
            height: 150.h,
            width: 150.w,
            decoration: BoxDecoration(
              // color: AppColor.secondaryMain,
              borderRadius: BorderRadius.circular(5.r),
              image:const DecorationImage(
                  image: AssetImage('assets/verifyicon.png'), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          NormalText(
            text: 'Profile Setup Successful!!',
            size: 24.sp,
            color: AppColor.secondaryMain,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            width: 311.w,
            height: 43.h,
            child: NormalText(
              textAlign: TextAlign.center,
              text:
                  'Congratulations, Your have successfully Setup your Profile',
              size: 16.sp,
              color: AppColor.grey400,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 110.h,
          ),
          ReuseableButton(
              text: 'Go to Main Screen',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const OnBoardingScreen()),
                  ),
                );
              }),
        ],
      ),
    ));
  }
}
