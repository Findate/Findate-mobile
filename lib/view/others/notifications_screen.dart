import 'package:findate/constants/appColor.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Notification appbar goes here
class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
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
                    text: 'Notification',
                    size: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.dullBlack,
                  ),
                ],
              ),
              const SizedBox(
                height: 19,
              ),
              Expanded(
                  child: SizedBox(
                child: ListView(
                  // Listview padding not working as expected
                  padding: const EdgeInsets.only(top: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    NotificationListPurple(),
                    NotificationListPink(),
                    NotificationListPurple(),
                    NotificationListPurple(),
                    NotificationListPurple(),
                    NotificationListPurple(),
                    NotificationListPink(),
                    NotificationListPurple(),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

//Notification List Purple
class NotificationListPurple extends StatefulWidget {
  const NotificationListPurple({Key? key}) : super(key: key);

  @override
  State<NotificationListPurple> createState() => _NotificationListPurpleState();
}

class _NotificationListPurpleState extends State<NotificationListPurple> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.deepPurpleAccent,
      ),
      height: 66,
      width: 343,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/homeImage1.png'),
                      maxRadius: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        NormalText(
                          text: 'Josphene Mark ',
                          size: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Likes Your Photo',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: const Icon(Icons.cancel, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '7 Hrs',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//Notification List Pink
class NotificationListPink extends StatefulWidget {
  const NotificationListPink({Key? key}) : super(key: key);

  @override
  State<NotificationListPink> createState() => _NotificationListPinkState();
}

class _NotificationListPinkState extends State<NotificationListPink> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.pinkAccent,
      ),
      height: 66,
      width: 343,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/homeImage1.png'),
                      maxRadius: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        NormalText(
                          text: 'Josphene Mark ',
                          size: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Likes Your Photo',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: const Icon(Icons.cancel, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '7 Hrs',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
