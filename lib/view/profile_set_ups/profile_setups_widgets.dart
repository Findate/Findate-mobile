// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:findate/constants/appColor.dart';
import 'package:findate/constants/app_state_constants.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

//First Setup Screen
class FirstSetupScreen extends StatefulWidget {
  final PageController pageController;
  const FirstSetupScreen({Key? key, required this.pageController})
      : super(key: key);

  @override
  State<FirstSetupScreen> createState() => _FirstSetupScreenState();
}

class _FirstSetupScreenState extends State<FirstSetupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  // Initial Selected Value
  String dropdownvalue = 'Male';

  // List of items in our dropdown menu
  var genders = [
    'Male',
    'Female',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: 800.h,
            child: Column(
              children: [
                //title and email column
                Column(
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    SmoothPageIndicator(
                      controller: widget.pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                          spacing: 70,
                          dotWidth: 10.w,
                          dotHeight: 10.h,
                          activeDotColor: AppColor.secondaryMain,
                          dotColor: Colors.black12),
                      onDotClicked: (index) => widget.pageController
                          .animateToPage(index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOut),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    NormalText(
                      text: 'Build Your Profile',
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      size: 24.sp,
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
                    NormalText(
                      text: 'Hi Jeean! Setup Your Profile',
                      color: AppColor.grey400,
                      fontWeight: FontWeight.w700,
                      size: 16.sp,
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          height: 100.h,
                          width: 150.w,
                          child: Image.asset('assets/profileAvatar.png'),
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
                                onPressed: () {}),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //Fields inputs column
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                      text: 'First Name',
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
                        controller: nameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Field cannot be empty';
                          }
                          return null;
                        },
                        cursorColor: AppColor.grey400,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16.w),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    NormalText(
                      text: 'Surname',
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
                        controller: surnameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Field cannot be empty';
                          }
                          return null;
                        },
                        cursorColor: AppColor.grey400,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16.w),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    NormalText(
                      text: 'Gender',
                      size: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: 343.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 0.5, color: AppColor.grey400),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isDense: false,
                          isExpanded: true,
                          // Initial Value
                          value: dropdownvalue,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Array list of items
                          items: genders.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ReuseableButton(
                      onPressed: () {
                        print('jjejeje');
                        widget.pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SecondSetupScreen(
                              pageController: widget.pageController,
                              name: nameController.text.trim(),
                              surname: surnameController.text.trim(),
                              gender: dropdownvalue.trim(),
                            ),
                          ),
                        );
                      },
                      text: 'Continue',
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//SecondSetupScreen

class SecondSetupScreen extends StatefulWidget {
  final PageController pageController;
  final String? name;
  final String? surname;
  final String? gender;

  const SecondSetupScreen(
      {Key? key,
      required this.pageController,
      this.name,
      this.gender,
      this.surname})
      : super(key: key);

  @override
  State<SecondSetupScreen> createState() => _SecondSetupScreenState();
}

class _SecondSetupScreenState extends State<SecondSetupScreen> {
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  CalendarFormat format = CalendarFormat.month;

  @override
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: 800,
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                SmoothPageIndicator(
                  controller: widget.pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      spacing: 70,
                      dotWidth: 10.w,
                      dotHeight: 10.h,
                      activeDotColor: AppColor.secondaryMain,
                      dotColor: Colors.black12),
                  onDotClicked: (index) => widget.pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    NormalText(
                      text: 'Choose your birthday',
                      size: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 450.h,
                      child:
                          // showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1990), lastDate: DateTime(2050))
                          TableCalendar(
                        firstDay: DateTime(1990),
                        focusedDay: DateTime.now(),
                        lastDay: DateTime(2050),
                        calendarFormat: format,
                        onFormatChanged: (CalendarFormat _format) {
                          setState(() {
                            format = _format;
                          });
                        },
                      ),
                    ),
                    NormalText(
                      text: 'Your Occupation',
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
                        controller: occupationController,
                        cursorColor: AppColor.grey400,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16.w),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 46.h,
                    ),
                    NormalText(
                      text: 'Your Location',
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
                        controller: locationController,
                        cursorColor: AppColor.grey400,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16.w),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ReuseableButton(
                      onPressed: () {
                        widget.pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ThirdSetupScreen(
                                pageController: widget.pageController,
                                name: widget.name,
                                surname: widget.surname,
                                gender: widget.gender,
                                occupation: occupationController.text.trim(),
                                location: occupationController.text.trim()),
                          ),
                        );
                      },
                      text: 'Continue',
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Third SetupScreen
class ThirdSetupScreen extends ConsumerStatefulWidget {
  final PageController pageController;
  final String? name;
  final String? surname;
  final String? gender;
  final String? location;
  final String? occupation;
  const ThirdSetupScreen({
    Key? key,
    required this.pageController,
    this.name,
    this.gender,
    this.surname,
    this.location,
    this.occupation,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ThirdSetupScreenState();
}

class _ThirdSetupScreenState extends ConsumerState<ThirdSetupScreen> {
  final TextEditingController interestController = TextEditingController();

  getData() {
    final data = {
      "name": widget.name,
      "surname": widget.surname,
      "location": widget.location,
      "gender": widget.gender,
      "occupation": widget.occupation,
      "interest": interestController.text.trim(),
    };
    return data;
  }

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 800,
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              SmoothPageIndicator(
                controller: widget.pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                    spacing: 70,
                    dotWidth: 10.w,
                    dotHeight: 10.h,
                    activeDotColor: AppColor.secondaryMain,
                    dotColor: Colors.black12),
                onDotClicked: (index) => widget.pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.5),
                    child: NormalText(
                      text: 'Select Interest',
                      size: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                    height: 200,
                    child: GridView.builder(
                      itemCount: 20,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 70,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return const Cards(message: 'Cooking');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.5),
                    child: TextFormField(
                        controller: interestController,
                        cursorColor: AppColor.grey400,
                        decoration: const InputDecoration(
                          hintText: 'Type interst here',
                          hintStyle:
                              TextStyle(color: AppColor.grey400, fontSize: 12),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.grey400),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.grey400),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.grey400),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ReuseableButton(
                    onPressed: () {
                      // authViewModel.updateProfile(getData(), context);
                      print(getData().toString);
                      print('jejejej');
                    },
                    text: 'Setup',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//individual cards for third set up screen

//   Widget cards(String message) {
//     return Padding(
//       padding: const EdgeInsets.all(7.5),
//       child: Container(
//         width: 164.w,
//         height: 12.h,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(width: 1.0, color: AppColor.secondaryMain),
//           borderRadius: BorderRadius.circular(5.r),
//         ),
//         child: Center(
//           child: NormalText(
//             text: message,
//             color: AppColor.secondaryMain,
//             size: 14.sp,
//           ),
//         ),
//       ),
//     );
//   }
}

class Cards extends StatefulWidget {
  final String message;

  const Cards({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.5),
      child: InkWell(
        onTap: () {
          setState(() {
            checked = !checked;
          });
        },
        child: Container(
          width: 164.w,
          height: 12.h,
          decoration: BoxDecoration(
            color: checked ? AppColor.secondaryMain : Colors.white,
            border: Border.all(width: 1.0, color: AppColor.secondaryMain),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Center(
            child: NormalText(
              text: widget.message,
              color: checked ? Colors.white : AppColor.secondaryMain,
              size: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
