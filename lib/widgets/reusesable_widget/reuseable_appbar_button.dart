import 'package:findate/constants/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusesableAppbarButton extends StatelessWidget {
  final IconButton iconButton;
  final Color? backGroundColor;
  ReusesableAppbarButton(
      {Key? key,
      required this.iconButton,
      this.backGroundColor = AppColor.mainColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 52.h,
          width: 52.w,
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.white,
              border: Border.all(
                color: const Color(0xffE8E6EA),
              ),
              borderRadius: BorderRadius.circular(15.r)),
          child: iconButton),
    );
  }
}
