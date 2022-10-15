import 'package:findate/constants/appColor.dart';
import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/view/auth/views/login_screen.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:findate/widgets/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  //sign up form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //password visibility
  bool _isObscure = true;
  bool _isObscure1 = true;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();

  //check of checked box is ticked or not
  bool check = false;

  getInputedData() {
    final body = {
      "username": userNameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "retypePassword": retypePasswordController.text.trim(),
    };
    return body;
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
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
                                color: const Color(0xff565656),
                                fontSize: 24.sp),
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          MyTextField(
                              controller: userNameController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Field cannot be empty';
                                }
                                return null;
                              },
                              isPassword: false,
                              obcureText: false,
                              isReadOnly: false,
                              labelText: 'Username',
                              keyBoardType: TextInputType.text),
                          const SizedBox(
                            height: 20,
                          ),
                          MyTextField(
                              controller: emailController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Field cannot be empty';
                                }
                                return null;
                              },
                              isPassword: false,
                              obcureText: false,
                              isReadOnly: false,
                              labelText: 'Email',
                              keyBoardType: TextInputType.text),
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
                            isPassword: true,
                            obcureText: _isObscure,
                            isReadOnly: false,
                            labelText: 'Password',
                            keyBoardType: TextInputType.text,
                            sufixIcon: IconButton(
                              color: AppColor.grey400,
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MyTextField(
                              controller: retypePasswordController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Field cannot be empty';
                                }
                                return null;
                              },
                              isPassword: true,
                              obcureText: _isObscure1,
                              isReadOnly: false,
                              labelText: 'Confirm Password',
                              sufixIcon: IconButton(
                                color: AppColor.grey400,
                                icon: Icon(_isObscure1
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure1 = !_isObscure1;
                                  });
                                },
                              ),
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
                                    color: const Color(0xff565656),
                                    fontSize: 20.sp),
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
                    ReuseableButton(
                        text: 'SignUp',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            authViewModel.regisUser(
                                '$baseUrl/register', getInputedData(), context);
                            print(getInputedData());
                          }
                        }),
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
                                      color: AppColor.dullBlack,
                                      fontSize: 14.sp)),
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
