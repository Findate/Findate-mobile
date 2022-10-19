import 'package:findate/constants/appColor.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppUpdate extends StatefulWidget {
  const AppUpdate ({Key? key}) : super(key: key);

  @override
  State<AppUpdate> createState() => _AppUpdateState();
}

class _AppUpdateState extends State<AppUpdate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.only(top:30 , left:16, right:16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children:[
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
                            text: 'App Update',
                            size: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.dullBlack,
                          ),
                        ]
                    ),
                    const SizedBox(height: 57,),
                          NormalText(
                            text: 'A new version of findate is available. Findate\nV1.2 comes with improved features to easily\nhelp you on our product',
                            size: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.dullBlack,
                          ),
                    const SizedBox(height: 330,),
                    ReuseableButton(
                      text: 'Update Now',
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
