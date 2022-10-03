import 'package:findate/constants/appColor.dart';
import 'package:findate/view/core/homepage/homepage_widgets.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          const [
            ReusesableAppbarButton(),
            ReuseHomepageHorizontalImageCard(
              imageUrl: 'homeImage1.png',
              name: 'Joel Tiana',
              location: 'Lagos',
            ),
            ReuseHomepageHorizontalImageCard(
              imageUrl: 'homeImage2.png',
              name: 'Mark John',
              location: 'Lagos',
            ),
            ReuseHomepageHorizontalImageCard(
              imageUrl: 'homeImage1.png',
              name: 'Joel Tiana',
              location: 'Lagos',
            ),
            ReuseHomepageHorizontalImageCard(
              imageUrl: 'homeImage2.png',
              name: 'Mark John',
              location: 'Lagos',
            ),
          ],
        ),
      ),
    ));
  }
}
