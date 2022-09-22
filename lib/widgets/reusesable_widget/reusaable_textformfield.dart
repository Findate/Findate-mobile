// ignore_for_file: prefer_const_constructors

import 'package:findate/constants/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final bool isPassword;
  final bool obcureText;
  final bool isReadOnly;
  final Color borderColor;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;
  final bool enable;

  const MyTextField({
    Key? key,
    this.borderColor = AppColor.mainColor,
    this.controller,
    this.hintText,
    required this.isPassword,
    required this.obcureText,
    required this.isReadOnly,
    required this.labelText,
    this.prefixIcon,
    this.sufixIcon,
    required this.keyBoardType,
    this.validator,
    this.enable = true,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      child: TextFormField(
        controller: widget.controller,
        readOnly: widget.isReadOnly,
        obscureText: widget.obcureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: AppColor.mainColor, fontSize: 16.sp),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Colors.black54, fontSize: 16.sp),
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: Icon(widget.sufixIcon),
          contentPadding: EdgeInsets.symmetric(vertical: 22, horizontal: 22.w),
          focusedBorder: widget.enable
              ? OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColor.mainColor, width: 1.0.w),
                  borderRadius: BorderRadius.circular(55),
                )
              : OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.mainColor, width: 1.0.w),
            borderRadius: BorderRadius.circular(55),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.mainColor, width: 1.0.w),
            borderRadius: BorderRadius.circular(55),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
