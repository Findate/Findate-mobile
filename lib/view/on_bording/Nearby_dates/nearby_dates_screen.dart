import 'package:findate/constants/appColor.dart';
import 'package:findate/view/on_bording/matches/matches_screen.dart';
import 'package:findate/view/on_bording/on_bording_screen.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyDates extends StatefulWidget {
  const NearbyDates({Key? key}) : super(key: key);

  @override
  State<NearbyDates> createState() => _NearbyDatesState();
}

class _NearbyDatesState extends State<NearbyDates> {
  //show location modal function
  void searchModalBottomSheetMenu() {
    showModalBottomSheet(
        isDismissible: true,
        context: context,
        builder: (builder) {
          return Container(
            margin: EdgeInsets.all(15.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            height: 400.h,
            width: 375.w,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    NormalText(
                      text: 'Filter',
                      fontWeight: FontWeight.bold,
                      size: 24,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 24,
                        ))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                      text: 'Preference',
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ReuseableButton(
                          margin: 0,
                          radius: 2.r,
                          text: 'Male',
                          onPressed: () {},
                          height: 32.4,
                          width: 110.w,
                          backGroundColor: const Color(0xffCCCCCC),
                        ),
                        ReuseableButton(
                          margin: 0,
                          radius: 2.r,
                          text: 'Female',
                          onPressed: () {},
                          height: 32.4,
                          width: 110.w,
                          backGroundColor: AppColor.secondaryMain,
                        ),
                        ReuseableButton(
                          margin: 0,
                          radius: 2.r,
                          text: 'Others',
                          onPressed: () {},
                          height: 32.4,
                          width: 110.w,
                          backGroundColor: const Color(0xffCCCCCC),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                      text: 'Location',
                      size: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      width: 343.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 0.5, color: AppColor.grey400),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: TextFormField(
                        cursorColor: AppColor.grey400,
                        decoration: InputDecoration(
                          labelText: 'FCT Abuja',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16.w),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(
                      text: 'Distance',
                      size: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    NormalText(
                      text: '24km',
                      size: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Slider(
                  min: 0,
                  max: 50,
                  value: 40,
                  thumbColor: Colors.red,
                  onChanged: (val) {},
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(
                      text: 'Age Range',
                      size: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    NormalText(
                      text: '19-24',
                      size: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Slider(
                  min: 0,
                  max: 50,
                  value: 40,
                  thumbColor: Colors.red,
                  onChanged: (val) {},
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(
                      text: 'Nearby Dates',
                      size: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    ReusesableAppbarButton(
                      iconButton: IconButton(
                        //on pressed function null
                        onPressed: () {
                          searchModalBottomSheetMenu();
                        },
                        icon: Icon(
                          Icons.tune,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.black,
                          size: 18,
                        ),
                        NormalText(
                          text: 'Your Location',
                          size: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    NormalText(
                      text: '   London',
                      size: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: 900,
            width: 375,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 500.h,
                    width: 375.w,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
