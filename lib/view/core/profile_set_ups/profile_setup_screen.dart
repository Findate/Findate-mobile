import 'package:findate/constants/appColor.dart';
import 'package:findate/view/auth/login_screen.dart';
import 'package:findate/view/core/profile_set_ups/profile_setups_widgets.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  late PageController _pageController;
  int currentPage = 0;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: currentPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: [
              firstSetupSreen(_pageController),
              secondSetupScreen(_pageController),
              firstSetupSreen(_pageController),
            ],
          ),
        ),
        bottomSheet: SizedBox(
          height: 150,
          child: Column(
            children: [
              ReuseableButton(
                  text: 'Continue',
                  onPressed: () {
                    !isLastPage
                        ? _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut)
                        : Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => const LoginScreen()),
                            ),
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

