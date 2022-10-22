// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:findate/constants/appColor.dart';
import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  File? image;

  Future pickGalaryImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() {
        this.image = imageTemporary;
        print(image);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickCameraImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 80.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.camera,
                              size: 40,
                              color: AppColor.mainColor,
                            ),
                            onPressed: () {
                              pickCameraImage();
                            },
                          ),
                          NormalText(
                            text: 'Camera',
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.photo,
                              size: 40,
                              color: AppColor.mainColor,
                            ),
                            onPressed: () {
                              pickGalaryImage();
                            },
                          ),
                          NormalText(
                            text: 'Gallary',
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: 1300.h,
            width: 375.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 375.w,
                  height: 275.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(authViewModel.userData[0].photo ==
                                null
                            ? authViewModel.userData[0].header!
                            : 'https://res.cloudinary.com/hyghdrogin/image/upload/v1665284795/Findate/findate_m0lrnn.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NormalText(
                              text: 'Profile',
                              size: 22.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            ReusesableAppbarButton(
                              backGroundColor: Colors.white,
                              iconButton: IconButton(
                                onPressed: () {
                                  pushSettingsScreen(context);
                                },
                                icon: const Icon(
                                  Icons.settings,
                                  color: AppColor.mainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      authViewModel.userData[0].header == null
                          ? Stack(
                              children: [
                                SizedBox(
                                  height: 100.h,
                                  width: 150.w,
                                  child:
                                      Image.asset('assets/profileAvatar.png'),
                                ),
                                Positioned(
                                  left: 100,
                                  top: 55,
                                  child: Container(
                                    width: 44.w,
                                    height: 44.h,
                                    decoration: const BoxDecoration(
                                      color: AppColor.mainColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.camera_alt_outlined,
                                          size: 24.h,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          _modalBottomSheetMenu();
                                        }),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    child: Column(children: [
                      ProfileCards(
                          title: 'Full Name',
                          lable: authViewModel.userData[0].name! +
                              authViewModel.userData[0].surname!),
                      ProfileCards(
                          title: 'Gender',
                          lable: authViewModel.userData[0].gender!),
                      ProfileCards(
                          title: 'Location',
                          lable: authViewModel.userData[0].location!),
                      ProfileCards(title: 'Date of birth'),
                      ProfileCards(
                          title: 'Occupation',
                          lable: authViewModel.userData[0].occupation!),
                      ProfileCards(
                          title: 'Interest',
                          lable: authViewModel.userData[0].interest!),
                      SizedBox(
                        height: 80.h,
                      ),
                      NormalText(text: 'Interests (Max 3 allowed)'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: ReuseableButton(
                              margin: 0,
                              radius: 2.r,
                              text: '+',
                              onPressed: () {},
                              height: 32.h,
                              width: 32.w,
                              backGroundColor: AppColor.mainColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ReuseableButton(
                              margin: 0,
                              radius: 2.r,
                              text: 'Pet',
                              onPressed: () {},
                              height: 32.4,
                              width: 90.w,
                              backGroundColor: AppColor.secondaryMain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ReuseableButton(
                              margin: 0,
                              radius: 2.r,
                              text: 'Cooking',
                              onPressed: () {},
                              height: 32.4,
                              width: 90.w,
                              backGroundColor: AppColor.secondaryMain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ReuseableButton(
                              margin: 0,
                              radius: 2.r,
                              text: 'Art',
                              onPressed: () {},
                              height: 32.4,
                              width: 90.w,
                              backGroundColor: AppColor.secondaryMain,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      NormalText(text: 'Preference'),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ReuseableButton(
                            margin: 0,
                            radius: 2.r,
                            text: 'Male',
                            onPressed: () {},
                            height: 32.4,
                            width: 110.w,
                            backGroundColor: const Color(0xffCCCCCC),
                          ),
                          ReuseableButton(
                            margin: 0,
                            radius: 2.r,
                            text: 'Female',
                            onPressed: () {},
                            height: 32.4,
                            width: 110.w,
                            backGroundColor: AppColor.secondaryMain,
                          ),
                          ReuseableButton(
                            margin: 0,
                            radius: 2.r,
                            text: 'Others',
                            onPressed: () {},
                            height: 32.4,
                            width: 110.w,
                            backGroundColor: const Color(0xffCCCCCC),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      NormalText(text: 'Photo Gallery'),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 103.w,
                            height: 124.h,
                            child: Image.asset('assets/profileImage.png'),
                          ),
                          SizedBox(
                            width: 103.w,
                            height: 124.h,
                            child: Image.asset('assets/profileImage1.png'),
                          ),
                          SizedBox(
                            width: 103.w,
                            height: 124.h,
                            child: Image.asset('assets/profileImage2.png'),
                          ),
                        ],
                      ),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileCards extends ConsumerStatefulWidget {
  String title;
  String lable;

  ProfileCards({Key? key, required this.title, this.lable = ''})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileCardsState();
}

class _ProfileCardsState extends ConsumerState<ProfileCards> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NormalText(
          text: widget.title,
          size: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          width: 343.w,
          height: 55.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.5, color: AppColor.grey400),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: TextFormField(
            cursorColor: AppColor.grey400,
            decoration: InputDecoration(
              labelText: widget.lable,
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16.w),
            ),
          ),
        ),
      ],
    );
  }
}
