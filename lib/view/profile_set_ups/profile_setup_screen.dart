
import 'package:findate/view/profile_set_ups/profile_setups_widgets.dart';

import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(20.0),
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: [
              FirstSetupScreen(
                pageController: _pageController,
              ),
              SecondSetupScreen(
                pageController: _pageController,
              ),
              ThirdSetupScreen(
                pageController: _pageController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
