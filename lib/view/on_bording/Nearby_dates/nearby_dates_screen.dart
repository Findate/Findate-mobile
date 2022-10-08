import 'package:findate/constants/appColor.dart';
import 'package:findate/view/on_bording/matches/matches_screen.dart';
import 'package:findate/view/on_bording/on_bording_screen.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyDates extends StatefulWidget {
  const NearbyDates({Key? key}) : super(key: key);

  @override
  State<NearbyDates> createState() => _NearbyDatesState();
}

class _NearbyDatesState extends State<NearbyDates> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 900,
              width: 375,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusesableAppbarButton(
                          iconButton: IconButton(
                        //Onpressed function null
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const OnBoardingScreen(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColor.mainColor,
                        ),
                      )),
                      NormalText(
                        text: 'Nearby Dates',
                        size: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      ReusesableAppbarButton(
                        iconButton: IconButton(
                          //on pressed function null
                          onPressed: () {},
                          icon: Icon(
                            Icons.format_list_bulleted_rounded,
                            color: AppColor.mainColor,
                            size: 30.h,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.black,
                              size: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: NormalText(
                                text: 'Your Location',
                                size: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: NormalText(
                          text: 'london',
                          size: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.grey400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 375.w,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: GridView.builder(
                          itemCount: 10,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (BuildContext context, int index) {
                            //Grid view of Nearby Dates
                            return const MatchGrid();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
