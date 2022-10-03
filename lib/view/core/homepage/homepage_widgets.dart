import 'package:findate/constants/appColor.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseHomepageHorizontalImageCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String location;
  const ReuseHomepageHorizontalImageCard({
    Key? key,
    required this.imageUrl,
    required this.name,
     required this.location,
    

  }) : super(key: key);

  @override
  State<ReuseHomepageHorizontalImageCard> createState() =>
      _ReuseHomepageHorizontalImageCardState();
}

class _ReuseHomepageHorizontalImageCardState
    extends State<ReuseHomepageHorizontalImageCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Container(
            height: 250.h,
            width: 343.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 179.h,
                  width: 343.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                        image: AssetImage(widget.imageUrl),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                NormalText(
                  text: widget.name,
                  size: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColor.mainColor,
                      size: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: NormalText(
                        text: widget.location,
                        size: 12.sp,
                        color: AppColor.grey400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 50.h,
              right: 30.w,
              child: Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: const BoxDecoration(
                      color: AppColor.secondaryMain,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: const BoxDecoration(
                      color: AppColor.mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.favorite, color: Colors.white),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
