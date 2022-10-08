import 'package:findate/constants/appColor.dart';
import 'package:findate/view/on_bording/explore/explore_widgets.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotOrNotScreen extends StatefulWidget {
  const HotOrNotScreen({Key? key}) : super(key: key);

  @override
  State<HotOrNotScreen> createState() => _HotOrNotScreenState();
}

class _HotOrNotScreenState extends State<HotOrNotScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
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
                text: 'Hot or Not',
                size: 22.sp,
                fontWeight: FontWeight.w600,
              ),
              ReusesableAppbarButton(
                iconButton: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.tune,
                    color: AppColor.mainColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 700.h,
            width: 375.w,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, int i) {
                  return const ExploreHorizontalImageCard(
                    imageUrl: 'assets/homeImage1.png',
                    name: 'Lydia',
                    location: 'Nigeria',
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
