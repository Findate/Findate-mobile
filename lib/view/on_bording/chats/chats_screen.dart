import 'package:findate/constants/appColor.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 700,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: NormalText(
                  text: 'Chat List',
                  size: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SizedBox(
                  height: 40.h,
                  width: 348.w,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search Dates and friends',
                      hintStyle:
                          TextStyle(color: Colors.black54, fontSize: 16.sp),
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.mainColor, width: 1.0.w),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColor.mainColor, width: 1.0.w),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35.h),
              Expanded(
                child: SizedBox(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      FirstChatList(
                        message: 'typing',
                        name: 'joel',
                        imageUrl: 'assets/homeImage1.png',
                      ),
                      FirstChatList(
                        message: 'kkkk',
                        name: 'joel',
                        imageUrl: 'assets/homeImage1.png',
                      ),
                      FirstChatList(
                        message: 'let link up today',
                        name: 'joel',
                        imageUrl: 'assets/homeImage1.png',
                      ),
                      FirstChatList(
                        message: 'can i know you better',
                        name: 'joel',
                        imageUrl: 'assets/homeImage1.png',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//First Chat List Row
class FirstChatList extends StatefulWidget {
  final String imageUrl;
  final String message;
  final String name;
  const FirstChatList(
      {Key? key,
      required this.imageUrl,
      required this.message,
      required this.name})
      : super(key: key);

  @override
  State<FirstChatList> createState() => _FirstChatListState();
}

class _FirstChatListState extends State<FirstChatList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 80.h,
        width: 375,
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        NormalText(
                          text: widget.name,
                          size: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        Text(
                          'just now',
                          style: TextStyle(
                              fontSize: 10,
                              color: AppColor.grey400,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.message,
                          style: const TextStyle(
                              fontSize: 12,
                              color: AppColor.mainColor,
                              fontWeight: FontWeight.w400),
                        ),
                        const Text(
                          'just now',
                          style: TextStyle(
                              fontSize: 10,
                              color: AppColor.grey400,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 201, 201, 201),
            )
          ],
        ),
      ),
    );
  }
}
