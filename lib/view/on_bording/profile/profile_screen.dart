// ignore_for_file: must_be_immutable

import 'package:findate/constants/appColor.dart';
import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
 final authViewModel = ref.watch(authViewModelProvider);
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: 1300.h,
          width: 375.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 375.w,
                height: 275.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/profileHeader.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NormalText(
                            text: 'Profile',
                            size: 22.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          ReusesableAppbarButton(
                            backGroundColor: Colors.white,
                            iconButton: IconButton(
                              onPressed: () {
                                pushSettingsScreen(context);
                              },
                              icon: const Icon(
                                Icons.settings,
                                color: AppColor.mainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          height: 100.h,
                          width: 150.w,
                          child: Image.asset('assets/profileAvatar.png'),
                        ),
                        Positioned(
                          left: 100,
                          top: 55,
                          child: Container(
                            width: 44.w,
                            height: 44.h,
                            decoration: const BoxDecoration(
                              color: AppColor.mainColor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 24.h,
                                  color: Colors.white,
                                ),
                                onPressed: () {}),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  child: Column(children: [
                    ProfileCards(title: 'Full Name', lable: authViewModel.singleUserData[0].name! + authViewModel.singleUserData[0].surname!),
                    ProfileCards(title: 'Gender', lable: authViewModel.singleUserData[0].gender!),
                    ProfileCards(title: 'Location', lable: authViewModel.singleUserData[0].location!),
                    ProfileCards(title: 'Date of birth'),
                    ProfileCards(title: 'Occupation', lable: authViewModel.singleUserData[0].occupation!),
                    ProfileCards(title: 'Interest', lable: authViewModel.singleUserData[0].interest!),
                    SizedBox(
                      height: 80.h,
                    ),
                    NormalText(text: 'Interests (Max 3 allowed)'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: ReuseableButton(
                            margin: 0,
                            radius: 2.r,
                            text: '+',
                            onPressed: () {},
                            height: 32.h,
                            width: 32.w,
                            backGroundColor: AppColor.mainColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ReuseableButton(
                            margin: 0,
                            radius: 2.r,
                            text: 'Pet',
                            onPressed: () {},
                            height: 32.4,
                            width: 90.w,
                            backGroundColor: AppColor.secondaryMain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ReuseableButton(
                            margin: 0,
                            radius: 2.r,
                            text: 'Cooking',
                            onPressed: () {},
                            height: 32.4,
                            width: 90.w,
                            backGroundColor: AppColor.secondaryMain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ReuseableButton(
                            margin: 0,
                            radius: 2.r,
                            text: 'Art',
                            onPressed: () {},
                            height: 32.4,
                            width: 90.w,
                            backGroundColor: AppColor.secondaryMain,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    NormalText(text: 'Preference'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ReuseableButton(
                          margin: 0,
                          radius: 2.r,
                          text: 'Male',
                          onPressed: () {},
                          height: 32.4,
                          width: 110.w,
                          backGroundColor: const Color(0xffCCCCCC),
                        ),
                        ReuseableButton(
                          margin: 0,
                          radius: 2.r,
                          text: 'Female',
                          onPressed: () {},
                          height: 32.4,
                          width: 110.w,
                          backGroundColor: AppColor.secondaryMain,
                        ),
                        ReuseableButton(
                          margin: 0,
                          radius: 2.r,
                          text: 'Others',
                          onPressed: () {},
                          height: 32.4,
                          width: 110.w,
                          backGroundColor: const Color(0xffCCCCCC),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    NormalText(text: 'Photo Gallery'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 103.w,
                          height: 124.h,
                          child: Image.asset('assets/profileImage.png'),
                        ),
                        SizedBox(
                          width: 103.w,
                          height: 124.h,
                          child: Image.asset('assets/profileImage1.png'),
                        ),
                        SizedBox(
                          width: 103.w,
                          height: 124.h,
                          child: Image.asset('assets/profileImage2.png'),
                        ),
                      ],
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCards extends ConsumerStatefulWidget {
  String title;
  String lable;

  ProfileCards({Key? key, required this.title, this.lable = ''}) : super(key: key);

  @override
 ConsumerState<ConsumerStatefulWidget>createState() => _ProfileCardsState();
}

class _ProfileCardsState extends ConsumerState<ProfileCards> {
  
  @override
  Widget build(BuildContext context) {
       
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NormalText(
          text: widget.title,
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
              labelText: widget.lable,
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16.w),
            ),
          ),
        ),
      ],
    );
  }
}
