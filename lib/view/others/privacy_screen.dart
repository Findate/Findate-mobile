import 'package:findate/constants/appColor.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
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
                  text: 'Privacy',
                  size: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.dullBlack,
                ),
              ],
            ),
          ),
          const SizedBox(height: 56),
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
                          //Right Icon not on Flutter
                          Icons.punch_clock_outlined,
                          size: 20,
                          color: AppColor.secondaryMain,
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        NormalText(
                          text: 'Blocked Users',
                          fontWeight: FontWeight.w600,
                          color: AppColor.grey400,
                          size: 16,
                        ),
                      ],
                    ),
                    IconButton(
                        //Add onpressed function
                        onPressed: () {
                          pushBlockedUsersScreen(context);
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
