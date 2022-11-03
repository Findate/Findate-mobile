import 'package:findate/constants/appColor.dart';
import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/view/on_bording/explore/explore_widgets.dart';
import 'package:findate/view/on_bording/on_bording_screen.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class PopularMatches extends ConsumerStatefulWidget {
  const PopularMatches({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PopularMatchesState();
}

class _PopularMatchesState extends ConsumerState<PopularMatches> {

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
    final authViewModel = ref.watch(authViewModelProvider);
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 900,
            width: 375,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusesableAppbarButton(
                      iconButton: IconButton(
                    //On pressed function null
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>const OnBoardingScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColor.mainColor,
                    ),
                  )),
                  NormalText(
                    text: 'Popular Matches',
                    size: 22.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  ReusesableAppbarButton(
                    iconButton: IconButton(
                      //On pressed function null
                      onPressed: () {
                        searchModalBottomSheetMenu();
                      },
                      icon: Icon(
                        Icons.tune_rounded,
                        color: AppColor.mainColor,
                        size: 30.h,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height:15.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,

                          size: 26,
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
                    padding: const EdgeInsets.only(left: 50.0),
                    child: NormalText(
                      text: authViewModel.userData[0].location!,
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
                      itemCount: authViewModel.userData.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return  ExploreSquareImageCard(
                      imageUrl: authViewModel.userData[index].photo!,
                              name: authViewModel.userData[index].name!,
                              location: authViewModel.userData[index].location!,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ]
            ),
          ),
        ),
      )),
    );
  }
}


//Grid view of Popular matches
class MatchGrid extends StatefulWidget {
  const MatchGrid({Key? key}) : super(key: key);

  @override
  State<MatchGrid> createState() => _MatchGridState();
}

class _MatchGridState extends State<MatchGrid> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160.h,
          width: 165.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: const DecorationImage(
                image: AssetImage('assets/homeImage3.png'), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: NormalText(
                  text: 'Tiana joel',
                  size: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: NormalText(
                      text: 'Los Angles',
                      size: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            right: 15,
            top: 10,
            child: IconButton(
              icon: Icon(
                !clicked ? Icons.favorite_outline_sharp : Icons.favorite,
                color: Colors.white,
                size: 30.h,
              ),
              onPressed: () {
                setState(() {
                  clicked = !clicked;
                });
              },
            ))
      ],
    );
  }
}
