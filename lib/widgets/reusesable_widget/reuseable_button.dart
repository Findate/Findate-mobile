// ignore_for_file: must_be_immutable

import 'package:findate/constants/appColor.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseableButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;
  final double? width;
  double? height = 50.h;
  final double textSize;
  final bool isActive;
  final Color backGroundColor;
  final Color textColor;
  final double? radius;
  final double? margin;

  ReuseableButton({
    Key? key,
    this.margin = 20,
    this.radius = 55,
    required this.text,
    required this.onPressed,
    this.height = 55,
    this.textSize = 16,
    this.width = 327,
    this.isActive = true,
    this.backGroundColor = AppColor.mainColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(margin!, 0.0.h, margin!, 0.0.h),
      height: height,
      width: width,
      child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius!),
            ),
            backgroundColor: backGroundColor,
            minimumSize: Size.fromHeight(70.h),
            primary: Colors.white,
          ),
          onPressed: isActive ? onPressed : null,
          child: NormalText(
            size: textSize,
            color: textColor,
            fontWeight: FontWeight.bold,
            text: text,
          )),
    );
  }
}
