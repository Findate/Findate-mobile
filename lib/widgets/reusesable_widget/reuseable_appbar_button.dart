
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusesableAppbarButton extends StatelessWidget {
  final IconButton iconButton;
  const ReusesableAppbarButton({Key? key, required this.iconButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
    
      },
      child: Container(
          height: 52.h,
          width: 52.w,
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffE8E6EA),
              ),
              borderRadius: BorderRadius.circular(15.r)),
          child: iconButton),
    );
  }
}
