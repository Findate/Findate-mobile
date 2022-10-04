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
      body: SizedBox(
        height: 1512.h,
        width: 375.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ReusesableAppbarButton(),
            const ReuseHomepageHorizontalImageCard(
              imageUrl: 'homeImage1.png',
              name: 'Joel Tiana',
              location: 'Lagos',
            ),
            SizedBox(
              height: 450.h,
              width: 375.w,
              child: Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return const HomepageSquareImageCard(
                      imageUrl: 'homeImage3.png',
                      name: 'Joel Tiana',
                      location: 'Lagos',
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
