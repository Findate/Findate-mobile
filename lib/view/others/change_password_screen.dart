import 'package:findate/constants/appColor.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
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
            child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  OldPassword(),
                  const SizedBox(height: 16),
                  NewPassword(),
                  const SizedBox(height: 16),
                  ConfirmPassword(),
                ]),
          ),
        ),
        //Sizedbox not effective as expected
        const SizedBox(
          height: 80,
        ),
        ReuseableButton(text: 'Change Password', onPressed: () {}),
      ]),
    ));
  }
}

//TEXT FORM FIELD WIDGETS FOR PASSWORDS
Widget OldPassword() {
  return TextFormField(
      decoration: const InputDecoration(
    prefixIcon: Icon(
      Icons.lock,
      size: 15,
    ),
    hintText: 'Input Old Password',
    border: OutlineInputBorder(),
  ));
}

Widget NewPassword() {
  return TextFormField(
      decoration: const InputDecoration(
    prefixIcon: Icon(
      Icons.lock,
      size: 15,
    ),
    hintText: 'Input New Password',
    border: OutlineInputBorder(),
  ));
}

Widget ConfirmPassword() {
  return TextFormField(
      decoration: const InputDecoration(
    prefixIcon: Icon(
      Icons.lock,
      size: 15,
    ),
    hintText: 'Confirm New Password',
    border: OutlineInputBorder(),
  ));
}
