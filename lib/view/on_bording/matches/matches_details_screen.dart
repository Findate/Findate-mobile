import 'package:findate/constants/appColor.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Popular matches last screen
class MatchUserInfo extends StatefulWidget {
  const MatchUserInfo({Key? key}) : super(key: key);

  @override
  State<MatchUserInfo> createState() => _MatchUserInfoState();
}

class _MatchUserInfoState extends State<MatchUserInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: 800.h,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusesableAppbarButton(
                  iconButton: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_left_outlined,
                      color: AppColor.mainColor,
                    ),
                  ),
                ),
                NormalText(
                  text: 'Popular Matches',
                  size: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
                ReusesableAppbarButton(
                  iconButton: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.tune_outlined,
                      color: AppColor.mainColor,
                    ),
                  ),
                ),
              ],
            ),
            // MatchCard()
            SizedBox(
              height: 715.h,
              width: 320.w,
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, int i) {
                    return const MatchCard();
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}

//Popular match Card widget
class MatchCard extends StatefulWidget {
  const MatchCard({Key? key}) : super(key: key);

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(color: Colors.white, height: 200,),
            Container(
              color: Colors.pink[50],
              height: 305.h,
              width: 320.w,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                      text: 'Tiana Joel',
                      size: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    Row(
                      children: [
                        const Icon(
                          // find right icon
                          Icons.do_not_disturb_on_total_silence_rounded,
                          color: Colors.green,
                          size: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: NormalText(
                            text: 'Recently Active',
                            size: 12.sp,
                            color: AppColor.grey400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColor.mainColor,
                          size: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: NormalText(
                            text: 'Lagos',
                            size: 12.sp,
                            color: AppColor.grey400,
                          ),
                        ),
                      ],
                    ),
                    Row(children: [
                      NormalText(
                          text:
                              'Lorem ipsum dolor sit amet, \n consectetur adpiscing elit.',
                          size: 12.sp,
                          color: AppColor.grey400),
                    ]),
                    SizedBox(
                      height: 40.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 40.w,
                        ),
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: const BoxDecoration(
                            color: AppColor.secondaryMain,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: const BoxDecoration(
                            color: AppColor.mainColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.favorite, color: Colors.white),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: const BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.message_rounded,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: -10,
          right: 5,
          left: 5,
          child: Container(
            height: 316.h,
            width: 310.w,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20.r),
              image: const DecorationImage(
                  image: AssetImage('assets/homeImage3.png'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }
}
//   decoration: BoxDecoration(
//             color: Color.alphaBlend(
//               const Color(0xffFF6685),
//               const Color(0xff6D64FF),
//             ),
          // ),