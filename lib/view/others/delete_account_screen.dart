import 'package:findate/constants/appColor.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
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
              const SizedBox(width: 44,),
              NormalText(
                text: 'Delete My Account',
                size: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.dullBlack,
              ),
            ]
            ),
            const SizedBox(height: 57,),
            Column(
                children: [
              NormalText(
                text: 'Are you sure you no longer need this account?',
                size: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.dullBlack,
              ),
              const SizedBox(height: 20),
              NormalText(
                text:
                    'Note that you will not be able to recover this\naccount after taking this action',
                size: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.dullBlack,
              ),
            ]
            ),
            const SizedBox(height: 330,),
            ReuseableButton(
              text: 'Delete My Account',
              backGroundColor: Colors.red,
              //add onpressed function
              onPressed: () {},
            ),
          ]
              )
      ),
    )
    );
  }
}
