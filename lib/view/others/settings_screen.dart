import 'package:findate/constants/appColor.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                        onPressed: () {},
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
