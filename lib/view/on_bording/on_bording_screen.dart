import 'package:findate/constants/appColor.dart';
import 'package:findate/view/on_bording/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Nearby_dates/nearby_dates_screen.dart';
import 'chats/chats_screen.dart';
import 'explore/explore_screen.dart';
import 'matches/matches_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static String id = 'onBordingScreen';
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // static const String id = 'onBoard';

  int currentIndex = 0;

  final screens = [
    const ExploreScreen(),
    const NearByDatesScreen(),
    const MatchesScreen(),
    const ChatsScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20.0.w,
        backgroundColor: Colors.white70,
        selectedItemColor: AppColor.mainColor,
        unselectedItemColor: AppColor.grey400,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Nearby',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
