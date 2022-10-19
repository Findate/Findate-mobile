import 'package:findate/constants/appColor.dart';
import 'package:findate/constants/shared_preferences.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/view/others/about_app_screen.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 300.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    NormalText(
                      text: 'Are you sure you want to logout?',
                      fontWeight: FontWeight.bold,
                      size: 16,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ReuseableButton(
                            width: 200.w,
                            backGroundColor: Colors.red,
                            textColor: Colors.white,
                            text: 'Log Out',
                            onPressed: () {
                              UserPreferences.resetSharedPref();
                              logout(context);
                            }),
                        SizedBox(
                          height: 20.h,
                        ),
                        ReuseableButton(
                            width: 200.w,
                            backGroundColor: Colors.white,
                            textColor: AppColor.mainColor,
                            text: 'Cancel',
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ],
                )),
          );
        });
  }

  bool toggled = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 16,
              right: 16,
            ),
            child: Row(
              children: [
                ReusesableAppbarButton(
                  iconButton: IconButton(
                    //Add onPressed function
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColor.mainColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                NormalText(
                  text: 'Settings',
                  size: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.dullBlack,
                ),
              ],
            ),
          ),
          const SizedBox(height: 91),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5, color: AppColor.grey400),
                borderRadius: BorderRadius.circular(5.r),
              ),
              height: 56,
              width: 343,
              child: Padding(
                padding: const EdgeInsets.only(left: 19, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          //replace with right Icon
                          Icons.shield,
                          size: 20,
                          color: AppColor.secondaryMain,
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        NormalText(
                          text: 'Security',
                          fontWeight: FontWeight.w600,
                          color: AppColor.grey400,
                          size: 16,
                        ),
                      ],
                    ),
                    IconButton(
                        //add on pressed function
                        onPressed: () {
                          pushSecurityScreen(context);
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: AppColor.mainColor,
                        ))
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // insert second row
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5, color: AppColor.grey400),
                borderRadius: BorderRadius.circular(5.r),
              ),
              height: 56,
              width: 341,
              child: Padding(
                padding: const EdgeInsets.only(left: 19, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.notifications_none_rounded,
                          size: 20,
                          color: AppColor.secondaryMain,
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        InkWell(
                          onTap: () {
                            !toggled ? null : pushNotiicatioScreen(context);
                          },
                          child: NormalText(
                            text: 'Notifications',
                            fontWeight: FontWeight.w600,
                            color: AppColor.grey400,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    Switch(
                      activeColor:
                          toggled ? AppColor.mainColor : AppColor.grey400,
                      value: toggled,
                      onChanged: (bool value) {
                        setState(() {
                          toggled = value;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),

          //insert third row
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5, color: AppColor.grey400),
                borderRadius: BorderRadius.circular(5.r),
              ),
              height: 56,
              width: 343,
              child: Padding(
                padding: const EdgeInsets.only(left: 19, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          size: 20,
                          color: AppColor.secondaryMain,
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        NormalText(
                          text: 'About App',
                          fontWeight: FontWeight.w600,
                          color: AppColor.grey400,
                          size: 16,
                        ),
                      ],
                    ),
                    IconButton(
                        //add onpressed function
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutApp(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: AppColor.mainColor,
                        ))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5, color: AppColor.grey400),
                borderRadius: BorderRadius.circular(5.r),
              ),
              height: 56,
              width: 343,
              child: Padding(
                padding: const EdgeInsets.only(left: 19, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          size: 20,
                          color: AppColor.secondaryMain,
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        NormalText(
                          text: 'Log Out',
                          fontWeight: FontWeight.w600,
                          color: AppColor.grey400,
                          size: 16,
                        ),
                      ],
                    ),
                    IconButton(
                        //add onpressed function
                        onPressed: () {
                          _modalBottomSheetMenu();
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: AppColor.mainColor,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
