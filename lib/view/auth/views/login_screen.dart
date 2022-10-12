import 'package:findate/constants/appColor.dart';
import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/view/auth/views/signup_screen.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:findate/widgets/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _key = GlobalKey<FormState>();
  bool check = false;

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    final requestBody = {
      "username": usernameController.text.trim(),
      "password": passwordController.text.trim()
    };

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
                      text: 'Welcome Back',
                      size: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff565656),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NormalText(
                      text: 'Login to connect with people',
                      size: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff808080),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: authViewModel.loginError,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.pink[100],
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            height: 100.h,
                            width: 340.w,
                            child: Row(
                              children: [
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 5.w, right: 5.w),
                                    child: Icon(
                                      Icons.error,
                                      color: const Color(0xffD32f2f),
                                      size: 24.w,
                                    )),
                                SizedBox(
                                  width: 300.w,
                                  child: NormalText(
                                    textAlign: TextAlign.start,
                                    text:
                                        'we didnt recognize that email address or password you can try again or use another login option',
                                    color: Colors.black54,
                                    size: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
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
                        onPressed: () {
                          
                          if (_key.currentState!.validate()) {
                            authViewModel.loginUser(
                                baseUrl,
                               requestBody,
                                context);

                            FocusScope.of(context).unfocus();
                          }
                        }),
                    SizedBox(
                      height: 26.h,
                    ),
                    Center(
                      child: NormalText(
                        text: 'Or Sign in with',
                        size: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 65, vertical: 20)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45.0),
                              ),
                            ),
                          ),
                          child: Image.asset('assets/facebook.png'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 65, vertical: 20)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45.0),
                              ),
                            ),
                          ),
                          child: Image.asset('assets/google.png'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => const SignUpScreen()),
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
                                  text: 'Dont have an account? ',
                                  style: TextStyle(
                                      color: AppColor.dullBlack,
                                      fontSize: 14.sp)),
                              TextSpan(
                                text: 'Sign Up',
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
