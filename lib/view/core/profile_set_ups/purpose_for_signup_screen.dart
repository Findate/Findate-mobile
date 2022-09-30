import 'package:findate/constants/appColor.dart';
import 'package:findate/view/core/profile_set_ups/profile_setup_screen.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PurposeForSignup extends StatefulWidget {
  const PurposeForSignup({Key? key}) : super(key: key);

  @override
  State<PurposeForSignup> createState() => _PurposeForSignupState();
}

class _PurposeForSignupState extends State<PurposeForSignup> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Row(
              children: [
                const ReusesableAppbarButton(),
                SizedBox(width: 40.w),
                NormalText(
                  text: 'Purpose For Sign Up',
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
                RichText(
                    text: TextSpan(
                        text: 'Hi Jeean! Why are you Here?',
                        style: GoogleFonts.nunito(
                          color: AppColor.grey400,
                          fontSize: 14.sp,
                        )))
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(42.0),
            ),
            CheckboxListTile(
              title: const Text('Ready for a relationship'),
              subtitle: Text('(Looking for a long term)',
                  style: GoogleFonts.nunito(
                    color: AppColor.grey400,
                    fontSize: 12.sp,
                  )),
              value: checked,
              onChanged: (bool? value) {
                setState(() {
                  checked = value!;
                });
              },
              checkColor: const Color(0xffFF6685),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const SizedBox(
              height: 20,
            ),
            CheckboxListTile(
              title: const Text('To find a date'),
              subtitle:
                  Text('(To go on date with a person with similar interest)',
                      style: GoogleFonts.nunito(
                        color: AppColor.grey400,
                        fontSize: 12.sp,
                      )),
              value: checked,
              onChanged: (bool? value) {
                setState(() {
                  checked = value!;
                });
              },
              checkColor: const Color(0xffFF6685),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const SizedBox(
              height: 20,
            ),
            CheckboxListTile(
              title: const Text('Friendship'),
              subtitle: Text('(Just here to talk to some and vibe)',
                  style: GoogleFonts.nunito(
                    color: AppColor.grey400,
                    fontSize: 14.sp,
                  )),
              value: checked,
              onChanged: (bool? value) {
                setState(() {
                  checked = value!;
                });
              },
              checkColor: const Color(0xffFF6685),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            const SizedBox(height: 30),
            ReuseableButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const ProfileSetupScreen()),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
