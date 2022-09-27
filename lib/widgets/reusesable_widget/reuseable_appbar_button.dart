import 'package:findate/constants/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusesableAppbarButton extends StatelessWidget {
  const ReusesableAppbarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:52.h,
      width: 52.w,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color:const Color(0xffE8E6EA), ), borderRadius: BorderRadius.circular(15.r)),
      child:const Icon(Icons.keyboard_arrow_left_outlined , color: AppColor.mainColor,),
    );
  }
}
