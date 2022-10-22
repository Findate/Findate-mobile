import 'package:findate/view/auth/views/confirm_email.dart';
import 'package:findate/view/auth/views/loginAfterReg.dart';
import 'package:findate/view/auth/views/login_screen.dart';
import 'package:findate/view/landing_page/no_internet_screen.dart';
import 'package:findate/view/on_bording/on_bording_screen.dart';
import 'package:findate/view/others/blocked_users_screen.dart';
import 'package:findate/view/others/notifications_screen.dart';
import 'package:findate/view/others/privacy_screen.dart';
import 'package:findate/view/others/security_screen.dart';
import 'package:findate/view/others/settings_screen.dart';
import 'package:findate/view/profile_set_ups/profile_setup_screen.dart';
import 'package:findate/view/profile_set_ups/purpose_for_signup_screen.dart';
import 'package:findate/widgets/reusesable_widget/complete_screen.dart';
import 'package:flutter/material.dart';

import '../view/auth/views/recover_account_confirm_email_screen.dart';





pushToNoInternetPage(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const NoInternetScreen(),
    ),
  );
}

pushToLoginPage(BuildContext context) async {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ),
  );
}

pushOnBoardingScreen(BuildContext context) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const OnBoardingScreen(),
    ),
  );
}

pushConfrimEmailScreen(BuildContext context, String email) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ConfirmEmailScreen(email: email),
    ),
  );
}

pushRecoverAccountConfrimEmailScreen(BuildContext context, String email) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => RecoverAccountConfirmEmailScreen(email: email),
    ),
  );
}

pushProfileSetupAfterReg(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) => CompleteScreen(
            bodyMessage:
                'Congratulations, you have completed your registration, please setup your profile',
            buttonMessage: 'Profile setup',
            headerMessage: 'Registration complete',
            navigate: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const PurposeForSignup()),
                ),
              );
            },
          )),
    ),
  );
}

pushLoginAfterProfileSetup(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) => CompleteScreen(
            bodyMessage:
                'Congratulations, you have completed your Profile Setup, please login ',
            buttonMessage: 'Login',
            headerMessage: 'Profile Setup complete',
            navigate: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const LoginAfterScreen()),
                ),
              );
            },
          )),
    ),
  );
}

pushSettingsScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) => const Settings()),
    ),
  );
}

pushSecurityScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) => const Security()),
    ),
  );
}

pushNotiicatioScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) => const NotificationPage()),
    ),
  );
}

pushPrivacyScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) => const Privacy()),
    ),
  );
}

pushBlockedUsersScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) => const BlockedUsers()),
    ),
  );
}

logout(BuildContext context) async {
  Navigator.of(context).pushNamedAndRemoveUntil(
    LoginScreen.id, (Route<dynamic> route) => false);
}




// pushCategoriesPage(BuildContext context) async {
//   Navigator.pushNamed(context, CategoriesPage.id);
// }

// pushSettingsScreen(BuildContext context) async {
//   Navigator.pushNamed(context, SettingsScreen.id);
// }

// pushToHomePage(BuildContext context) async {
//   Navigator.of(context).pushReplacement(
//     MaterialPageRoute(
//       builder: (context) => const HomePageScreen(),
//     ),
//   );
// }

// pushMaterialScreen(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const MaterialCardScreen1(),
//     ),
//   );
// }

// pushScholarshipScreen(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const ScholarshipScreen(),
//     ),
//   );
// }

// pushAboutUsScreen(BuildContext context) async {
//   Navigator.of(context).pushReplacement(
//     MaterialPageRoute(
//       builder: (context) => const AboutUsScreen(),
//     ),
//   );
// }

// pushLogOutScreen(BuildContext context) async {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return const LogOutScreen();
//       });
// }

// pushDeleteNote(BuildContext context) async {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return const DeleteNoteScreen();
//       });
// }

// pushCatergoriesSearchScreen(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: ((context) => const CatergoriesSearchScreen()),
//     ),
//   );
// }

// pushEmailPasswordChangeScreen(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: ((context) => const EmailPasswordChangeScreen()),
//     ),
//   );
// }

// pushSignUpScreen1(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: ((context) => const SignUpScreen1()),
//     ),
//   );
// }

// pushNoticeScreen(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const NoticeScreen1(),
//     ),
//   );
// }

// pushNotificationScreen(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const NotificationScreen(),
//     ),
//   );
// }

// pushSchoolPortalScreen(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const SchoolPortal(),
//     ),
//   );
// }

// pushNoteBookScreen1(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const NoteBookScreen1(),
//     ),
//   );
// }

// pushNoteBookScreen2(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const NoteBookScreen2(),
//     ),
//   );
// }

// pushNoteBookScreen3(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const NoteBookScreen3(),
//     ),
//   );
// }



// pushToOnboardingPage(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const OnBoardingScreen(),
//     ),
//   );
// }

// pushToLoginPage(BuildContext context) async {
//   Navigator.of(context).pushNamed(LoginScreen.id);
// }
