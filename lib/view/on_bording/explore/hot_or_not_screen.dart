import 'package:findate/constants/appColor.dart';
import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/view/on_bording/explore/explore_widgets.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HotOrNotScreen extends ConsumerStatefulWidget {
  const HotOrNotScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HotOrNotScreenState();
}

class _HotOrNotScreenState extends ConsumerState<HotOrNotScreen> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusesableAppbarButton(
                    iconButton: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_left_outlined,
                        color: AppColor.mainColor,
                      ),
                    ),
                  ),
                  NormalText(
                    text: 'Hot or Not',
                    size: 22.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  ReusesableAppbarButton(
                    iconButton: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.tune,
                        color: AppColor.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 750.h,
                width: 375.w,
                child: ListView.builder(
                    itemCount: authViewModel.userData.length,
                    itemBuilder: (context, int index) {
                      return  ExploreHorizontalImageCard(
                                  imageUrl: authViewModel.userData[index].photo!,
                                  name: authViewModel.userData[index].name!,
                                  location: authViewModel.userData[index].location!,
                                );
                    }),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
