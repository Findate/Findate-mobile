import 'package:findate/constants/appColor.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController pageController;
  int currentPage = 0;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();

    pageController =
        PageController(initialPage: currentPage, viewportFraction: 0.9.w);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            buildPage(
                urlImage: 'assets/landingImage1.png',
                title: 'Turn Your Romantic Dreams into Live Experiences',
                message:
                    'At no Cost, Findate  simply grows your confidence, ignite your flame, and sucessfully   find you a date you will save in your love calendar for the rest of your life'),
            buildPage(
                urlImage: 'assets/landingImage2.png',
                title: 'Meet and Connect with the Right parts You Desire',
                message:
                    'Findate connects you to prospective partners of similar interests, through our online community of several nearby users. '),
            buildPage(
                urlImage: 'assets/landingImage3.png',
                title: 'Ready For An Everlasting Romantic Experience',
                message:
                    'Findate is that discreet place you need.  Findate is built with special app features to help you reach your match'),
          ],
        ),
        bottomSheet: SizedBox(
          height: 250.h,
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              ReuseableButton(
                text: 'Continue',
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              TextButton(
                onPressed: () {},
                child: NormalText(
                  text: 'Skip',
                  color: AppColor.mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPage({
    required String urlImage,
    required String title,
    String message = '',
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Container(
            height: 248.h,
            width: 327.w,
            decoration: BoxDecoration(
              // color: AppColor.secondaryMain,
              borderRadius: BorderRadius.circular(5.r),
              image: DecorationImage(
                  image: AssetImage(urlImage), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: WormEffect(
                  dotWidth: 10.w,
                  dotHeight: 10.h,
                  activeDotColor: AppColor.mainColor,
                  dotColor: Colors.black12),
              onDotClicked: (index) => pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          SizedBox(
            width: 343.w,
            child: NormalText(
              textAlign: TextAlign.center,
              text: title,
              size: 20.sp,
              color: AppColor.secondaryMain,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          SizedBox(
            height: 7.h,
          ),
          SizedBox(
            width: 343.w,
            child: NormalText(
              textAlign: TextAlign.center,
              text: message,
              size: 16.sp,
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }
}
