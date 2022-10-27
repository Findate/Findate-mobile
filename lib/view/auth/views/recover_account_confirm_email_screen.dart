import 'dart:async';

import 'package:findate/constants/appColor.dart';
import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/view/auth/auth_view_models/auth_view_model.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:findate/widgets/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RecoverAccountConfirmEmailScreen extends ConsumerStatefulWidget {
  final String? email;
  const RecoverAccountConfirmEmailScreen({Key? key, this.email})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecoverAccountConfirmEmailScreenState();
}

class _RecoverAccountConfirmEmailScreenState
    extends ConsumerState<RecoverAccountConfirmEmailScreen> {
  // controller to access pin text input
  final pinController = TextEditingController();
  final psaaword1Controller = TextEditingController();
  final psaaword2Controller = TextEditingController();

  // controller to access pin input error
  StreamController<ErrorAnimationType>? errorController;

  //bool to check if pin input has errors
  bool hasError = false;

  //acess text inputed
  String currentText = "";

  //form key
  final _key = GlobalKey<FormState>();

  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  _resendCode(AuthViewModel auth) {
    auth.resendOTP({"email": widget.email}, context);
    //other code here
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final authViewModel = ref.watch(authViewModelProvider);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: 900.h,
            child: Stack(
              children: [
                Column(
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
                                text:
                                    'A verification code was sent to \n ${widget.email}',
                                style: GoogleFonts.nunito(
                                  color: AppColor.grey400,
                                  fontSize: 14.sp,
                                ),
                              ),
                              TextSpan(
                                text: '',
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
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            PinCodeTextField(
                              controller: pinController,
                              appContext: context,
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
                              keyboardType: TextInputType.number,
                              boxShadows: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ],
                              onChanged: (value) {
                                // debugPrint(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            MyTextField(
                              controller: psaaword1Controller,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Field cannot be empty';
                                }
                                return null;
                              },
                              isPassword: false,
                              obcureText: false,
                              isReadOnly: false,
                              labelText: 'password',
                              keyBoardType: TextInputType.text,
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            MyTextField(
                              controller: psaaword2Controller,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Field cannot be empty';
                                }
                                return null;
                              },
                              isPassword: false,
                              obcureText: false,
                              isReadOnly: false,
                              labelText: 'confirm password',
                              keyBoardType: TextInputType.text,
                            )
                          ],
                        ),
                      ),
                    ),
                    ReuseableButton(
                      width: 250.w,
                        text: 'Verify',
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            authViewModel.resetPassword({
                              "token": pinController.text.trim(),
                              "password": psaaword1Controller.text.trim(),
                              "retypePassword": psaaword2Controller.text.trim()
                            }, widget.email, context);
                          }
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      !enableResend
                          ? 'Please resend code after $secondsRemaining seconds'
                          : '',
                      style:
                          const TextStyle(color: AppColor.mainColor, fontSize: 12),
                    ),
                    // Show same texts with different colors
                    TextButton(
                      onPressed: () {
                        // authViewModel.resendOTP({"email": widget.email}, context);
        
                        enableResend ? _resendCode(authViewModel) : null;
                      },
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.sp,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'I did not receive any code, ',
                                style: TextStyle(
                                    color: AppColor.dullBlack, fontSize: 15.sp)),
                            TextSpan(
                              text: 'Resend Code',
                              style: TextStyle(
                                  color: !enableResend
                                      ? Colors.black
                                      : AppColor.mainColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  child: authViewModel.loading
                      ? const ProgressDialog(
                          message: 'Loading....',
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
      
        // FlatButton(
        //   child: Text('Resend Code'),
        //   onPressed: 
        // ),
        // Text(
        //   'after $secondsRemaining seconds',
        //   style: TextStyle(color: Colors.white, fontSize: 10),
        // ),