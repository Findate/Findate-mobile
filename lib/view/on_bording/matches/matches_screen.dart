import 'package:findate/constants/appColor.dart';
import 'package:findate/view/on_bording/on_bording_screen.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularMatches extends StatefulWidget {
  const PopularMatches({Key? key}) : super(key: key);

  @override
  State<PopularMatches> createState() => _PopularMatchesState();
}

class _PopularMatchesState extends State<PopularMatches> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(12.0),
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
                      itemCount: 14,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return const MatchGrid();
                      },
                    ),
                  ),
                ),
              ),
            ]),
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
          bottom: 10,
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
