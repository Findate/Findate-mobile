import 'package:findate/view/auth/views/login_screen.dart';
import 'package:findate/view/on_bording/on_bording_screen.dart';
import 'package:findate/widgets/reusesable_widget/complete_screen.dart';
import 'package:findate/view/profile_set_ups/profile_setups_widgets.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
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
          padding: const EdgeInsets.all(16.0),
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
        // bottomSheet: SizedBox(
        //   height: 120,
        //   child: Column(
        //     children: [
        //       ReuseableButton(
        //           text: 'Continue',
        //           onPressed: () {
        //             !isLastPage
        //                 ? _pageController.nextPage(
        //                     duration: const Duration(milliseconds: 500),
        //                     curve: Curves.easeOut)
        //                 : Navigator.of(context).push(
        //                     MaterialPageRoute(
        //                       builder: ((context) => CompleteScreen(
        //                             bodyMessage:
        //                                 'Congratulations, you have completed your profile set up, please login to continue',
        //                             buttonMessage: 'login',
        //                             headerMessage: 'Profile setup complete',
        //                             navigate: () {
                               
        //                             },
        //                           )),
        //                     ),
        //                   );
        //           }),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
