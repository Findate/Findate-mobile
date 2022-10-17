import 'package:findate/constants/appColor.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlockedUsers extends StatefulWidget {
  const BlockedUsers({Key? key}) : super(key: key);

  @override
  State<BlockedUsers> createState() => _BlockedUsersState();
}

class _BlockedUsersState extends State<BlockedUsers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 16,
              right: 16,
            ),
            child: Row(children: [
              ReusesableAppbarButton(
                iconButton: IconButton(
                  //Add onPressed function
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColor.mainColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 70,
              ),
              NormalText(
                text: 'Blocked Users',
                size: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.dullBlack,
              ),
            ])),
        const SizedBox(
          height: 56,
        ),
        Expanded(
          child: SizedBox(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                //Put list view children - Done
                BlockedUsersList(),
                BlockedUsersList(),
                BlockedUsersList(),
                BlockedUsersList(),
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}

class BlockedUsersList extends StatefulWidget {
  const BlockedUsersList({Key? key}) : super(key: key);

  @override
  State<BlockedUsersList> createState() => _BlockedUsersListState();
}

class _BlockedUsersListState extends State<BlockedUsersList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.5, color: AppColor.grey400),
          borderRadius: BorderRadius.circular(5.r),
        ),
        height: 66,
        width: 343,
        child: Column(children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 16,
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/homeImage1.png'),
                  maxRadius: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 11,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    NormalText(
                      text: 'Mark Shalem',
                      size: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.grey400,
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
