import 'package:findate/constants/appColor.dart';
import 'package:findate/routes/page_routes.dart';
import 'package:findate/view/others/change_password_screen.dart';
import 'package:findate/view/others/delete_account_screen.dart';
import 'package:findate/view/others/update_screen.dart';
import 'package:findate/widgets/reusesable_widget/normal_text.dart';
import 'package:findate/widgets/reusesable_widget/reuseable_appbar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Security extends StatefulWidget {
  const Security({Key? key}) : super(key: key);

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
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
            child: Row(
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
                  text: 'Security',
                  size: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.dullBlack,
                ),
              ],
            ),
          ),
          const SizedBox(height: 91),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePassword(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: AppColor.grey400),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                height: 56,
                width: 343,
                child: Padding(
                  padding: const EdgeInsets.only(left: 19, right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            //Find right Icon
                            Icons.mouse_outlined,
                            size: 20,
                            color: AppColor.secondaryMain,
                          ),
                          const SizedBox(
                            width: 11,
                          ),
                          NormalText(
                            text: 'Change Password',
                            fontWeight: FontWeight.w600,
                            color: AppColor.grey400,
                            size: 16,
                          ),
                        ],
                      ),
                      IconButton(
                          //add onpressed function
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChangePassword(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: AppColor.mainColor,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // insert second row
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: InkWell(
              onTap: () {
                pushPrivacyScreen(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: AppColor.grey400),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                height: 56,
                width: 341,
                child: Padding(
                  padding: const EdgeInsets.only(left: 19, right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            //find right Icon
                            Icons.shield,
                            size: 20,
                            color: AppColor.secondaryMain,
                          ),
                          const SizedBox(
                            width: 11,
                          ),
                          NormalText(
                            text: 'Privacy',
                            fontWeight: FontWeight.w600,
                            color: AppColor.grey400,
                            size: 16,
                          ),
                        ],
                      ),
                      IconButton(
                          //add onpressed function
                          onPressed: () {
                            pushPrivacyScreen(context);
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: AppColor.mainColor,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          //insert third row
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppUpdate(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: AppColor.grey400),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                height: 56,
                width: 343,
                child: Padding(
                  padding: const EdgeInsets.only(left: 19, right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.notifications_none_rounded,
                            size: 20,
                            color: AppColor.secondaryMain,
                          ),
                          const SizedBox(
                            width: 11,
                          ),
                          NormalText(
                            text: 'App Update',
                            fontWeight: FontWeight.w600,
                            color: AppColor.grey400,
                            size: 16,
                          ),
                        ],
                      ),
                      IconButton(
                          //add onpressed function
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AppUpdate(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: AppColor.mainColor,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Insert forth row
          const SizedBox(
            height: 24,
          ),

          //insert forth row
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeleteAccount(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: AppColor.grey400),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                height: 56,
                width: 343,
                child: Padding(
                  padding: const EdgeInsets.only(left: 19, right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            //find right Icon
                            Icons.delete_forever,
                            size: 20,
                            color: AppColor.secondaryMain,
                          ),
                          const SizedBox(
                            width: 11,
                          ),
                          NormalText(
                            text: 'Delete my Account',
                            fontWeight: FontWeight.w600,
                            color: AppColor.grey400,
                            size: 16,
                          ),
                        ],
                      ),
                      IconButton(
                          //add on pressed function
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DeleteAccount(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: AppColor.mainColor,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
