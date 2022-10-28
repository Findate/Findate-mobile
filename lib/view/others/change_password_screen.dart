import 'package:findate/constants/appColor.dart';
import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends ConsumerStatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends ConsumerState<ChangePassword> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    return SafeArea(
        child: Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
          child: Row(children: [
            ReusesableAppbarButton(
              iconButton: IconButton(
                //Add onPressed function
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColor.mainColor,
                ),
              ),
            ),
            const SizedBox(
              width: 49,
            ),
            NormalText(
              text: 'Change Password',
              size: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.dullBlack,
            ),
          ]),
        ),
        const SizedBox(
          height: 33,
        ),
        SizedBox(
          height: 450,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Form(
              key: _key,
              child: Column(children: [
                TextFormField(
                    controller: oldPasswordController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Field cannot be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 15,
                      ),
                      hintText: 'Input Old Password',
                      border: OutlineInputBorder(),
                    )),
                const SizedBox(height: 16),
                TextFormField(
                    controller: newPasswordController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Field cannot be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 15,
                      ),
                      hintText: 'Input New Password',
                      border: OutlineInputBorder(),
                    )),
                const SizedBox(height: 16),
                TextFormField(
                    controller: confirmPasswordController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Field cannot be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 15,
                      ),
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(),
                    )),
              ]),
            ),
          ),
        ),
        //Sizedbox not effective as expected
        const SizedBox(
          height: 80,
        ),
        ReuseableButton(
            text: 'Change Password',
            onPressed: () {
              if (_key.currentState!.validate()) {
                authViewModel.changePassword({
                  "oldPassword": oldPasswordController.text.trim(),
                  "newPassword": newPasswordController.text.trim(),
                  "retypeNewPassword": confirmPasswordController.text.trim()
                }, context);
              }
            }),
      ]),
    ));
  }
}
