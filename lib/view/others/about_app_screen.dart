import 'package:findate/constants/appColor.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
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
                      const SizedBox(width: 81,),
                      NormalText(
                        text: 'About App',
                        size: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.dullBlack,
                      ),
                    ]
                ),
                const SizedBox(height: 57,),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Findate connects you to prospective partners\nof similar interests, through our online\ncommunity of several nearby users. Our in app\nalgorithm suggests perfect partner matches to\ncolour your desires with memories. ',
                        style: TextStyle(
                            color: AppColor.grey400,
                            fontSize: 19.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: 'Learn\nMore......',
                        style: TextStyle(
                            color: AppColor.mainColor,
                            fontSize: 19.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
