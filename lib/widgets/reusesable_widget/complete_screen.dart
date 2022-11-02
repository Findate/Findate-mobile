// ignore_for_file: must_be_immutable

import 'package:findate/constants/appColor.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteScreen extends StatelessWidget {
  String headerMessage;
  String bodyMessage;
  String buttonMessage;
  GestureTapCallback navigate;
  CompleteScreen(
      {Key? key,
      required this.bodyMessage,
      required this.buttonMessage,
      required this.headerMessage,
      required this.navigate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 170.h,
            width: 170.w,
            decoration: BoxDecoration(
              // color: AppColor.secondaryMain,
              borderRadius: BorderRadius.circular(5.r),
              image: const DecorationImage(
                  image: AssetImage('assets/verifyicon.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          NormalText(
            text: headerMessage,
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
              text: bodyMessage,
              size: 16.sp,
              color: AppColor.grey400,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 110.h,
          ),
          ReuseableButton(
            text: buttonMessage,
            onPressed: navigate,
          ),
        ],
      ),
    ));
  }
}


class Tests extends ConsumerStatefulWidget {
  const Tests({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestsState();
}

class _TestsState extends ConsumerState<Tests> {

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: const Duration(seconds: 10),);
  }
}