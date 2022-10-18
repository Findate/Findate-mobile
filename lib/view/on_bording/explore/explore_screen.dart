import 'package:findate/constants/appColor.dart';
import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/constants/shared_preferences.dart';
import 'package:findate/view/on_bording/explore/explore_widgets.dart';
import 'package:findate/view/on_bording/explore/hot_or_not_screen.dart';
import 'package:findate/view/on_bording/matches/matches_details_screen.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  @override
  void initState() {
    super.initState();
// get pref key
    final initialized = UserPreferences.getInitialized();

//call modal sheet function
    Future.delayed(Duration.zero, () {
      //if key wasnt set means its null, call modalsheet fuction else do nothing
      initialized == null ? modalBottomSheetMenu() : null;
    });
    //set key to true to init dont call modalshet again aftr first call
    UserPreferences.setInitialized(true);
  }

//show location modal function
  void modalBottomSheetMenu() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (builder) {
          return Center(
            child: Container(
              height: 449.h,
              width: 343.w,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 248.h,
                    width: 327.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      image: const DecorationImage(
                          image: AssetImage('assets/location.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  NormalText(
                    text: 'Share your location',
                    color: AppColor.secondaryMain,
                    fontWeight: FontWeight.w700,
                    size: 20,
                  ),
                  SizedBox(
                    height: 68.h,
                    width: 311.w,
                    child: NormalText(
                        textAlign: TextAlign.center,
                        text:
                            "Findate Needs access to your location to provide a betterexperience by helping you find friends nearby",
                        fontWeight: FontWeight.w600,
                        size: 16),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      ReuseableButton(
                        height: 36.h,
                        width: 128.w,
                        text: 'Skip',
                        onPressed: () {
                        Navigator.pop(context);
                        },
                        backGroundColor: const Color(0xffF5F5F5),
                        textColor: AppColor.mainColor,
                      ),
                      ReuseableButton(
                          height: 36.h,
                          width: 128.w,
                          text: 'Share ',
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

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
                          onPressed: () {
                            
                          },
                          icon: const Icon(
                            Icons.notifications_on_outlined,
                            color: AppColor.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 110.h,
                    width: 375.w,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 12,
                        itemBuilder: (context, int i) {
                          return const ExploreImageStoryCard(
                            name: 'jane',
                            imageUrl: 'assets/homeImage1.png',
                          );
                        }),
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
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => const HotOrNotScreen()),
                            ),
                          );
                        },
                        child: NormalText(
                          text: 'view all',
                          size: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey400,
                        ),
                      ),
                    ],
                  ),
                  //reusesable card for horizontal image card in explore screen
                  const ExploreHorizontalImageCard(
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
                            labelStyle: TextStyle(
                                color: Colors.black54, fontSize: 16.sp),
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
                            Icons.tune,
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
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => const MatchUserInfo()),
                            ),
                          );
                        },
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
                            return const ExploreSquareImageCard(
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
      ),
    );
  }
}
