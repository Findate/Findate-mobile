import 'package:findate/constants/appColor.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchScreen extends ConsumerStatefulWidget {
  const MatchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MatchScreenState();
}

class _MatchScreenState extends ConsumerState<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    NormalText(
                      text: 'Matches',
                      size: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    NormalText(
                      text: 'We Found You One Match',
                      size: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                //will hold images
                SizedBox(
                  height: 260.h,
                ),
                //  full card
                SizedBox(
                  height: 340.h,
                  width: 322.w,
                  child: Column(
                    children: [
                      // top container star
                      Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          gradient: AppColor.mixedColorgradient,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.star_border,
                              color: Colors.white,
                              size: 16,
                            ),
                            const Icon(
                              Icons.star_border,
                              color: Colors.white,
                              size: 16,
                            ),
                            const Icon(
                              Icons.star_border,
                              color: Colors.white,
                              size: 16,
                            ),
                            NormalText(
                              text: 'Perfect Match',
                              color: Colors.white,
                            ),
                            const Icon(
                              Icons.star_border,
                              color: Colors.white,
                              size: 16,
                            ),
                            const Icon(
                              Icons.star_border,
                              color: Colors.white,
                              size: 16,
                            ),
                            const Icon(
                              Icons.star_border,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                      //hold middle content
                      SizedBox(
                        height: 240.h,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            NormalText(
                              text: 'What’s in common?',
                              size: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              width: 200.w,
                              height: 50.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      NormalText(
                                        text: 'Age: : ',
                                        color: const Color(0xff565656),
                                        fontWeight: FontWeight.w500,
                                        size: 14.sp,
                                      ),
                                      NormalText(
                                        text: '22',
                                        color: AppColor.secondaryMain,
                                        fontWeight: FontWeight.w500,
                                        size: 14.sp,
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Divider(
                                      color: Color(0xff565656),
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 200.w,
                              height: 50.h,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      NormalText(
                                        text: 'Gender Preferences: : ',
                                        color: const Color(0xff565656),
                                        fontWeight: FontWeight.w500,
                                        size: 14.sp,
                                      ),
                                      NormalText(
                                        text: 'Ok',
                                        color: AppColor.secondaryMain,
                                        fontWeight: FontWeight.w500,
                                        size: 14.sp,
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Divider(
                                      color: Color(0xff565656),
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 200.w,
                              height: 45.h,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      NormalText(
                                        text: 'Interests: ',
                                        color: const Color(0xff565656),
                                        fontWeight: FontWeight.w500,
                                        size: 14.sp,
                                      ),
                                      NormalText(
                                        text: 'Food, Cooking',
                                        color: AppColor.secondaryMain,
                                        fontWeight: FontWeight.w500,
                                        size: 14.sp,
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Divider(
                                      color: Color(0xff565656),
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 200.w,
                              height: 45.h,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      NormalText(
                                        text: 'Location: ',
                                        color: const Color(0xff565656),
                                        fontWeight: FontWeight.w500,
                                        size: 14.sp,
                                      ),
                                      NormalText(
                                        text: 'New Jersey',
                                        color: AppColor.secondaryMain,
                                        fontWeight: FontWeight.w500,
                                        size: 14.sp,
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Divider(
                                      color: Color(0xff565656),
                                      thickness: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // bottom star container
                      Container(
                        height: 50.h,
                        width: 343.w,
                        decoration: BoxDecoration(
                          gradient: AppColor.mixedColorgradient,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r)),
                        ),
                        child: Center(
                          child: NormalText(
                            text: 'Eligible to Become Soulmate',
                            size: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        size: 24,
                        color: Colors.red,
                      ),
                    ),
                    NormalText(
                      text: 'Become Soulmates!',
                      size: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(
                  height: 68.h,
                  width: 268.w,
                  child: NormalText(
                    textAlign: TextAlign.center,
                    text:
                        'Soulmates make each other stronger, happier, and more passionate in life.  Your soulmate will love even the parts of you that you think are hard to love.',
                    size: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                ReuseableButton(text: 'Send Request', onPressed: () {}),
                ReuseableButton(
                  text: 'Cancel',
                  onPressed: () {},
                  backGroundColor: Colors.white,
                  textColor: AppColor.mainColor,
                ),
                SizedBox(height: 20.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
