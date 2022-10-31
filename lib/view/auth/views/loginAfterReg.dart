

// ignore_for_file: file_names

import 'package:findate/constants/appColor.dart';
import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:findate/widgets/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginAfterScreen extends ConsumerStatefulWidget {
  const LoginAfterScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginAfterScreenState();
}

class _LoginAfterScreenState extends ConsumerState<LoginAfterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _key = GlobalKey<FormState>();
  bool check = false;

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    NormalText(
                      text: 'Glad to have you here',
                      size: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff565656),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NormalText(
                      text: 'Please login to continue',
                      size: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff808080),
                    ),
                    SizedBox(height: 20.h,),
                    Form(
                      key: _key,
                      child: Column(
                        children: [
                          MyTextField(
                            controller: usernameController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              return null;
                            },
                            prefixIcon: Icons.person,
                            isPassword: false,
                            obcureText: false,
                            isReadOnly: false,
                            labelText: 'User Name',
                            keyBoardType: TextInputType.text,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MyTextField(
                              controller: passwordController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Field cannot be empty';
                                }
                                return null;
                              },
                              prefixIcon: Icons.lock,
                              isPassword: true,
                              obcureText: true,
                              isReadOnly: false,
                              labelText: 'Password',
                              keyBoardType: TextInputType.text),
                        ],
                      ),
                    ),
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
                        NormalText(text: 'Remember Me'),
                        const SizedBox(
                          width: 40,
                        ),
                        NormalText(
                          text: 'Forgot Password',
                          color: const Color(0xff6D64FF),
                          size: 16.sp,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ReuseableButton(
                        width: 323.w,
                        text: 'Login',
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            await authViewModel.loginUserAfterReg(
                                '$baseUrl/login',
                                {
                                  "username": usernameController.text.trim(),
                                  "password": passwordController.text.trim()
                                },
                                context);
                          }
                        }),
                  ],
                ),
              ),
            ),
            //display loading dialog
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
    );
  }
}
