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
  final TextEditingController emailController = TextEditingController();

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
                      text: 'Reset Code will be sent to that email',
                      size: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff565656),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                      controller: emailController,
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
                      labelText: 'Email',
                      keyBoardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ReuseableButton(
                        width: 323.w,
                        text: 'Reset Password',
                        onPressed: () async {
                          authViewModel.recoverAccount(
                              {
                                "email": emailController.text,
                              },
                              emailController.text,
                               context);
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
