// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:io';

import 'package:findate/constants/appColor.dart';
import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/constants/shared_preferences.dart';
import 'package:findate/models/userModel.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/view/auth/auth_view_models/auth_view_model.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:findate/widgets/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as PAth;
import 'dart:typed_data';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  File? profilePic;
  bool update = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController interestController = TextEditingController();

// funtion that upload profie pic from gallary
  Future pickGalaryImage() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 80);

      if (image == null) return;

      final imagePath = await savePicture(image.path);
      setState(() {
        profilePic = imagePath;
      });

      await AuthViewModel.instance.updateProfilePix(profilePic, context);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

// funtion that upload profie pic from camera
  Future pickCameraImage() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 80);

      if (image == null) return;

      final imagePath = await savePicture(image.path);

      setState(() {
        profilePic = imagePath;
      });

      await AuthViewModel.instance.updateProfilePix(profilePic, context);

      // refreshImage();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

//saved picture path before upload
  Future<File> savePicture(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = PAth.basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
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
                              Navigator.pop(context);
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
                              Navigator.pop(context);
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

  getData() {
    final data = {
      "name": nameController.text.trim(),
      "surname": surnameController.text.trim(),
      "location": locationController.text.trim(),
      "gender": genderController.text.trim(),
      "occupation": occupationController.text.trim(),
      "dob": dobController.text.trim(),
      "interest": interestController.text.trim(),
    };
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    final userApiData = ref.watch(provider);

    nameController.text =
        "${userApiData.name ?? authViewModel.userData.first.name!} ${userApiData.surname ?? authViewModel.userData.first.surname!}";
    locationController.text =
        userApiData.location ?? authViewModel.userData.first.location!;
    occupationController.text =
        userApiData.occupation ?? authViewModel.userData.first.occupation!;
    dobController.text = userApiData.dob ?? authViewModel.userData.first.dob!;
    genderController.text =
        userApiData.dob ?? authViewModel.userData.first.gender!;


    String pic = "${userApiData.photo}?t=${DateTime.now().millisecond}";
 

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
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
                            // profile header image
                            image: NetworkImage(userApiData.header ??
                                'https://res.cloudinary.com/hyghdrogin/image/upload/v1665284795/Findate/findate_m0lrnn.jpg'),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      update = !update;
                                    });
                                    if (update) {
                                      authViewModel.updateProfile(
                                          getData(), context);
                                    }
                                  },
                                  child: NormalText(
                                    text: update ? 'Edit' : 'Save',
                                    size: 22.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.mainColor,
                                  ),
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
                          Stack(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(pic),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 100,
                                bottom: 10,
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        child: Column(children: [
                          ProfileCards(
                            title: 'Full Name',
                            controller: nameController,
                            editable: update,
                          ),
                          ProfileCards(
                            title: 'Gender',
                            controller: genderController,
                            editable: update,
                          ),
                          ProfileCards(
                            controller: locationController,
                            editable: update,
                            title: 'Location',
                          ),
                          ProfileCards(
                            controller: dobController,
                            editable: update,
                            title: 'Date of birth',
                          ),
                          ProfileCards(
                            controller: occupationController,
                            editable: update,
                            title: 'Occupation',
                          ),
                          ProfileCards(
                            controller: interestController,
                            editable: update,
                            title: 'Interest',
                          ),
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
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: authViewModel.loading
                  ? const ProgressDialog(
                      message: 'Loading....',
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCards extends ConsumerStatefulWidget {
  String title;
  String lable;
  TextEditingController? controller;
  bool editable = false;

  ProfileCards(
      {Key? key,
      required this.title,
      this.lable = '',
      required this.controller,
      required this.editable})
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
            readOnly: widget.editable,
            controller: widget.controller,
            cursorColor: AppColor.grey400,
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.black),
              // hintText: widget.lable,
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16.w),
            ),
          ),
        ),
      ],
    );
  }
}
