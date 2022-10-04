import 'package:findate/constants/appColor.dart';
import 'package:findate/view/core/homepage/homepage_widgets.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reusaable_textformfield.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 900.h,
            width: 375.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(
                      text: 'Explore',
                      size: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    ReusesableAppbarButton(
                      iconButton: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_on_outlined,
                          color: AppColor.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(
                      text: 'Hot or Not',
                      size: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: NormalText(
                        text: 'view all',
                        size: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grey400,
                      ),
                    ),
                  ],
                ),
                const ReuseHomepageHorizontalImageCard(
                  imageUrl: 'assets/homeImage1.png',
                  name: 'Joel Tiana',
                  location: 'Lagos',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: 262.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Search Dates and friends',
                          labelStyle:
                              TextStyle(color: Colors.black54, fontSize: 16.sp),
                          prefixIcon: IconButton(
                            icon: const Icon(
                              Icons.search,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.mainColor, width: 1.0.w),
                            borderRadius: BorderRadius.circular(55),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.mainColor, width: 1.0.w),
                            borderRadius: BorderRadius.circular(55),
                          ),
                        ),
                      ),
                    ),
                    ReusesableAppbarButton(
                      iconButton: IconButton(
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(
                      text: 'Popular Matches',
                      size: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: NormalText(
                        text: 'view all',
                        size: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grey400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                // scrolable image cards
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
                          return const HomepageSquareImageCard(
                            imageUrl: 'assets/homeImage3.png',
                            name: 'Joel Tiana',
                            location: 'Lagos',
                          );
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
    ));
  }
}
