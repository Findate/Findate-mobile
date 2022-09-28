import 'package:findate/constants/appColor.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //title and email column
              Column(
                children: [
                  NormalText(
                    text: 'Build Your Profile',
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    size: 24.sp,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  NormalText(
                    text: 'Hi Jeean! Setup Your Profile',
                    color: AppColor.grey400,
                    fontWeight: FontWeight.w700,
                    size: 16.sp,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: Image.asset('assets/profileAvatar.png'),
                  ),
                ],
              ),
              //Fields inputs column
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NormalText(
                    text: 'Name',
                    size: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    width: 343.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.5, color: AppColor.grey400),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: TextFormField(
                      cursorColor: AppColor.grey400,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.w),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                      NormalText(
                    text: 'Surname',
                    size: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    width: 343.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.5, color: AppColor.grey400),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: TextFormField(
                      cursorColor: AppColor.grey400,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.w),
                      ),
                    ),
                  ),SizedBox(
                    height: 24.h,
                  ),
                      NormalText(
                    text: 'Gender',
                    size: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    width: 343.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.5, color: AppColor.grey400),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: TextFormField(
                      cursorColor: AppColor.grey400,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16.w),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  ReuseableButton(text: 'Continue', onPressed: (){})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
