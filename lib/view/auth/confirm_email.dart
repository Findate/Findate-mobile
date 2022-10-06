import 'dart:async';

import 'package:findate/constants/appColor.dart';
import 'package:findate/view/profile_set_ups/purpose_for_signup_screen.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmEmailScreen extends StatefulWidget {
  const ConfirmEmailScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmEmailScreen> createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<ConfirmEmailScreen> {
  // controller to access pin text input
  TextEditingController textEditingController = TextEditingController();

  // controller to access pin input error
  StreamController<ErrorAnimationType>? errorController;

  //bool to check if pin input has errors
  bool hasError = false;

  //acess text inputed
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                ReusesableAppbarButton(
                  iconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_left_outlined,
                        color: AppColor.mainColor,
                      )),
                ),
                SizedBox(
                  width: 40.w,
                ),
                NormalText(
                  text: 'Email Verification',
                  color: AppColor.mainColor,
                  size: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30.w,
                ),
                // Show same texts with different colors
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'A verification code was sent to \n',
                        
                        style: GoogleFonts.nunito(
                          color: AppColor.grey400,
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'Abiodunmercy@gmail.com',
                        style: GoogleFonts.nunito(
                          color: AppColor.secondaryMain,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //Pin text field
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: PinCodeTextField(
                appContext: context,
                // pastedTextStyle: TextStyle(
                //   color: Colors.green.shade600,
                //   fontWeight: FontWeight.bold,
                // ),
                length: 4,
                obscureText: true,
                obscuringCharacter: '*',
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v!.length < 4) {
                    return "Pin Must be 4 digits";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                    activeColor: Colors.white,
                    activeFillColor: Colors.white,
                    selectedColor: AppColor.mainColor,
                    inactiveColor: const Color(0xffFF6685),
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 60.h,
                    fieldWidth: 60.w,
                    borderWidth: 0.3),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
                // onCompleted: (v) {
                //   debugPrint("Completed");
                // },
                // onTap: () {
                //   print("Pressed");
                // },
                onChanged: (value) {
                  // debugPrint(value);
                  setState(() {
                    currentText = value;
                  });
                },
                // beforeTextPaste: (text) {
                //   debugPrint("Allowing to paste $text");
                //   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //   //but you can show anything you want here, like your pop up saying wrong paste format or etc
                //   return false;
                // },
              ),
            ),
            ReuseableButton(
                text: 'Verify',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const PurposeForSignup()),
                    ),
                  );
                }),
            const SizedBox(
              height: 40,
            ),
            // Show same texts with different colors
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.sp,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'I did not receive any code, ',
                      style: TextStyle(
                          color: AppColor.dullBlack, fontSize: 14.sp)),
                  TextSpan(
                    text: 'Resend Code',
                    style: TextStyle(
                        color: AppColor.mainColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
