import 'package:findate/constants/appColor.dart';
import 'package:findate/view/auth/login_screen.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: const Color(0xff565656),
                    fontSize: 16.sp,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Welcome to ',
                      style: TextStyle(
                          color: const Color(0xff565656), fontSize: 24.sp),
                    ),
                    TextSpan(
                      text: 'Findate',
                      style: TextStyle(
                          color: AppColor.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              NormalText(
                text: 'Sign Up to enjoy our product',
                size: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff808080),
              ),
              const SizedBox(
                height: 20,
              ),
              const MyTextField(
                  isPassword: false,
                  obcureText: false,
                  isReadOnly: false,
                  labelText: 'First Name',
                  keyBoardType: TextInputType.text),
              const SizedBox(
                height: 20,
              ),
              const MyTextField(
                  isPassword: false,
                  obcureText: false,
                  isReadOnly: false,
                  labelText: 'Last Name',
                  keyBoardType: TextInputType.text),
              const SizedBox(
                height: 20,
              ),
              const MyTextField(
                  isPassword: false,
                  obcureText: false,
                  isReadOnly: false,
                  labelText: 'Email',
                  keyBoardType: TextInputType.text),
              const SizedBox(
                height: 20,
              ),
              const MyTextField(
                  isPassword: false,
                  obcureText: false,
                  isReadOnly: false,
                  labelText: 'Password',
                  keyBoardType: TextInputType.text,
                  sufixIcon: Icons.visibility_off),
              const SizedBox(
                height: 20,
              ),
              const MyTextField(
                  isPassword: false,
                  obcureText: false,
                  isReadOnly: false,
                  labelText: 'Confirm Password',
                  sufixIcon: Icons.visibility_off,
                  keyBoardType: TextInputType.text),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                    value: check,
                    activeColor: AppColor.mainColor,
                    checkColor: AppColor.mainColor,
                    focusColor: AppColor.mainColor,
                    hoverColor: AppColor.mainColor,
                    onChanged: (bool? newValue) {
                      setState(() {
                        check = newValue!;
                      });
                    },
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: const Color(0xff565656),
                        fontSize: 16.sp,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'I agree with the ',
                          style: TextStyle(
                              color: const Color(0xff565656), fontSize: 20.sp),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                              color: const Color(0xff6D64FF),
                              fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ReuseableButton(text: 'SignUp', onPressed: () {}),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const LoginScreen()),
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.sp,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                                color: AppColor.dullBlack, fontSize: 14.sp)),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                              color: const Color(0xff6D64FF),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
