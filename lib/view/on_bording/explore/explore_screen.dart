import 'package:findate/constants/appColor.dart';
import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/constants/shared_preferences.dart';
import 'package:findate/view/on_bording/explore/explore_widgets.dart';
import 'package:findate/view/on_bording/explore/hot_or_not_screen.dart';
import 'package:findate/view/on_bording/matches/matches_details_screen.dart';
import 'package:findate/view/on_bording/matches/popular_screen.dart';
import 'package:findate/view/others/notifications_screen.dart';
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
      initialized == null ? locationModalBottomSheetMenu() : null;
    });
    //set key to true to init dont call modalshet again aftr first call
    UserPreferences.setInitialized(true);
  }

//show location modal function
  void locationModalBottomSheetMenu() {
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
                        fontWeight: FontWeight.w300,
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
    
    final allUser = ref.watch(authViewModelProvider);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(180.h),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationPage(),
                            ),
                          );
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
                  height: 100.h,
                  width: 375.w,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allUser.userData.length,
                      itemBuilder: (context, int i) {
                        return ExploreImageStoryCard(
                          name: allUser.userData[i].name!,
                          imageUrl: allUser.userData[i].photo!,
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
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
                  SizedBox(
                    height: 270.h,
                    width: 375.w,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: allUser.userData.length,
                        itemBuilder: (context, int i) {
                          return ExploreHorizontalImageCard(
                            imageUrl: allUser.userData[i].photo!,
                            name: allUser.userData[i].name!,
                            location: allUser.userData[i].location!,
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          searchModalBottomSheetMenu();
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 10.w),
                          alignment: Alignment.centerLeft,
                          width: 262.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(width: 0.5, color: AppColor.grey400),
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          child: const Icon(
                            Icons.search,
                            size: 26,
                          ),
                        ),
                      ),
                      ReusesableAppbarButton(
                        iconButton: IconButton(
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
                              builder: ((context) => const PopularMatches()),
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
                          itemCount: allUser.userData.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (BuildContext context, int i) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) =>
                                        const MatchUserInfo()),
                                  ),
                                );
                              },
                              child: ExploreSquareImageCard(
                                imageUrl: allUser.userData[i].photo!,
                                name: allUser.userData[i].name!,
                                location: allUser.userData[i].location!,
                              ),
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
